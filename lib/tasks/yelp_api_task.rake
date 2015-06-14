require 'yelp'
require 'csv'


namespace :export do
    desc "Will out put CSV's for Subscribers"
    task :caterers => :environment do

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

          trending = @client.search("New York City, NY", params)
        end
      end

      new_search = Yelpcall.new

      caterers = new_search.search

      CSV.open("./caterers.csv", "w+") do |csv|
        caterers.businesses.each do |business|
          begin
            phone = business.phone
          rescue => e
            phone = "NA"
          end
          name = business.name
          physical_address = business.location.display_address.first
          city = business.location.city
          state = business.location.state_code
          csv << [name, physical_address, city, state, phone]
        end
      end
    end
  end