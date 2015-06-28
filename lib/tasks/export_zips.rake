require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'csv'
require 'mechanize'

namespace :export do
    desc "Will out put CSV's for Subscribers"
    task :zips => :environment do
        
        agent = Mechanize.new
        mech_page = agent.get("http://www.zipcodelist.org/home/arizona-zip-code-list")

            
        CSV.open("#{Rails.root}/public/zips.csv", "a") do |csv|
            page = mech_page.parser

                new_array = []

                page.css('tbody tr').each do |scrape|
                        
                    zip = scrape.css('td p span')[0].text
                    p zip
                    new_array << zip
                end
                p new_array.length
                csv << new_array
                
        end
    end
end