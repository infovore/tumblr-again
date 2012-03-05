require 'rubygems' 
gem 'httparty', "<= 4.3"
require 'httparty'

require 'tumblr/blog'

class Tumblr    
  attr_reader :api_key
  include HTTParty
  # tumblr errors
  class TumblrError < StandardError; end
  # tumblr 403 errors
  class Forbidden   < TumblrError; end
  # tumblr 400 errors
  class BadRequest  < TumblrError; end  
  # tumblr 404 errors
  class NotFound    < TumblrError; end
  
end

