require 'yelp'
require 'dotenv'
# require 'httparty'
Dotenv.load

class Yelpcall
  def initialize
    @client = Yelp::Client.new({
      consumer_key: ENV['consumer_key'],
      consumer_secret: ENV['consumer_secret'],
      token: ENV['token'],
      token_secret: ENV['token_secret']})
  end

  def search
    params = {sort: 2, term: "caterer"}

    trending = @client.search("San Francisco, CA", params)
    # trending.businesses.each do |business|
    #   p "#{business.name}: #{business.rating} (#{business.url})"
    # end
  end
end

new_search = Yelpcall.new
p new_search.search