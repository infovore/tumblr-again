class Tumblr
  class Blog
    include HTTParty

    attr_reader :blog
    attr_reader :api_key
    attr_reader :base_uri

    def initialize(api_key, _blog)
      @blog = (_blog =~ /\./) ? _blog : "#{_blog}.tumblr.com"
      @api_key = api_key
      @base_uri = "http://api.tumblr.com/v2/blog/#{@blog}"
    end

    def info
      options = {}
      options[:query] = {:api_key => @api_key} # no options here

      r = self.class.get("#{@base_uri}/info", options)
      r["response"]["blog"]
    end

    def avatar(size=nil)
      valid_sizes = [16, 24, 30, 40, 48, 64, 96, 128, 512]
      if size && !valid_sizes.include?(size)
        raise Tumblr::InvalidSize
      else
        if size
          r = self.class.get("#{@base_uri}/avatar/#{size}")
        else
          r = self.class.get("#{@base_uri}/avatar")
        end
      end
    end
  end
end
