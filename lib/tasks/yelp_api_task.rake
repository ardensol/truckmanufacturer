require 'yelp'
require 'csv'
require 'dotenv/tasks'


namespace :export do
    desc "Will out put CSV's for Subscribers"
    task :caterers => :environment do

      class Yelpcall
        def initialize
          @client = Yelp::Client.new({
            consumer_key: ENV["consumer_key"],
            consumer_secret: ENV["consumer_secret"],
            token: ENV["token"],
            token_secret: ENV["token_secret"]})
        end

        def search(zip)
          params = {sort: 2, term: "caterers"}

          trending = @client.search(zip, params)
        end
      end

      
      CSV.open("./caterers.csv", "w+") do |csv|
        zips = ["90067", "98039", "07931", "06831", "94957", "94027", "06840", "92067", "06820", "07078", "10004", "11568", "60043", "06883", "94028", "63124", "10580", "02193", "77210", "06830", "07021", "10577", "19807", "90210", "90077", "60045", "10514", "90071", "07924", "94022", "19085", "19035", "06880", "78730", "10506", "06878", "07945", "10022", "60093", "92657", "07458", "91436", "06490", "06870", "07901", "10504", "06897", "02181", "94920", "07417", "06853", "90212", "19041", "02108", "30327", "78746", "60022", "90272", "22066", "06903", "07046", "95109", "10280", "60606", "77024", "10510", "08558", "02493", "02030", "10538", "95070", "66211", "33480", "07760", "90402", "10583", "75225", "28207", "10576", "94506", "94104", "90010", "94111", "11724", "78257", "94507", "77002", "75205", "07930", "34228", "01741", "10028", "77005", "10005", "11560", "94024", "94301" ]
        
        zips.each do |zip|
          new_search = Yelpcall.new
          caterers = new_search.search(zip)

          p zip

          caterers.businesses.each do |business|
            begin
              phone = business.phone
            rescue => e
              phone = "NA"
            end

            begin
              actual_zip = business.location.postal_code
            rescue => e
              actual_zip = "NA"
            end
            url = business.url
            name = business.name
            physical_address = business.location.display_address.first
            city = business.location.city
            state = business.location.state_code
            rating = business.rating
            is_claimed = business.is_claimed
            is_closed = business.is_closed
            review_count = business.review_count
            csv << [name, physical_address, city, state, actual_zip, phone, rating, review_count, is_claimed, is_closed, url, zip]
          end
        end
      end
    end
  end