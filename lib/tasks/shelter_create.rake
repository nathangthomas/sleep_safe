require 'yaml'

namespace :import do
   desc "Add shelters to database"
   task shelters: :environment do

    denver_zipcodes = ["80012", "80014", "80022", "80033", "80123", "80127", "80202", "80203", "80204", "80205", "80206", "80207", "80209", "80210", "80211", "80212", "80214", "80215", "80216", "80218", "80219", "80220", "80221", "80222", "80223", "80224", "80225", "80226", "80227", "80228", "80229", "80230", "80231", "80232", "80233", "80234", "80235", "80236", "80237", "80238", "80239", "80241", "80246", "80247", "80249", "80260", "80264", "80265", "80266", "80290", "80293", "80294", "80299"]


    denver_zipcodes.each do |zip|

      conn_1 = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
        faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
        faraday.params["components"] = "postal_code:#{zip}"
        faraday.adapter Faraday.default_adapter
      end

      response_1 = conn_1.get("https://maps.googleapis.com/maps/api/geocode/json?")
        data_1 = JSON.parse(response_1.body, symbolize_names: true)
      coordinates = data_1[:results][0][:geometry][:location].values.join(",")

      conn_2 = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
        faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
        faraday.params["radius"] = 10
        faraday.params["keyword"] = "homeless shelter"
        faraday.params["location"] = coordinates
        faraday.adapter Faraday.default_adapter
      end

      basic_response = conn_2.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?")
      basic_shelter_data = JSON.parse(basic_response.body, symbolize_names: true)
      shelter_place_ids = basic_shelter_data[:results].map{|shelter| shelter[:place_id]}

      shelter_place_ids.map do |i|
        conn_3 = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
          faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
          faraday.params["placeid"] = i
          faraday.params["fields"] = "name,formatted_address,formatted_phone_number,opening_hours,geometry"
          faraday.adapter Faraday.default_adapter
        end

      detailed_response = conn_3.get("https://maps.googleapis.com/maps/api/place/details/json?")
        detailed_shelter_data = JSON.parse(detailed_response.body, symbolize_names: true)

      name = detailed_shelter_data[:result][:name]
      address = detailed_shelter_data[:result][:formatted_address]
      zip = detailed_shelter_data[:result][:formatted_address].split(',')[2].split(' ')[1]
      phone_number = detailed_shelter_data[:result][:formatted_phone_number]
      hours = detailed_shelter_data[:result][:opening_hours]
      lat = detailed_shelter_data[:result][:geometry][:location][:lat]
      lng = detailed_shelter_data[:result][:geometry][:location][:lng]
      Shelter.create!(name: name, address: address, phone_number: phone_number, hours: hours, latitude: lat, longitude: lng, zip: zip)
      end
    end
  end
end




# require 'active_record'
# require 'yaml'
#
# namespace :app do
#
#   # Checks and ensures task is not run in production.
#   task :ensure_development_environment => :environment do
#     if Rails.env.production?
#       raise "\nI'm sorry, I can't do that.\n(You're asking me to drop your production database.)"
#     end
#   end
#
#   # # Custom install for developement environment
#   # desc "Install"
#   # task :install => [:ensure_development_environment, "db:migrate", "db:test:prepare", "db:seed", "app:populate", "spec"]
#
#   # Custom reset for developement environment
#   desc "Reset"
#   task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]
#
#   # Populates development data
#   desc "Populate the database with development data using ActiveRecord Migrations.\n(Target specific version with VERSION=x)"
#   task :populate => :environment do
#   	puts "#{'*'*(`tput cols`.to_i)}\nChecking Environment... The database will be cleared of all content before populating.\n#{'*'*(`tput cols`.to_i)}"
#     # Removes content before populating with data to avoid duplication
#     Rake::Task['db:reset'].invoke
#
#     # Rake using Rails Migrations
#     dbconf = YAML::load(File.open('config/database.yml'))
#     ActiveRecord::Base.establish_connection(dbconf[::Rails.env])
#     ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
#     ActiveRecord::Migrator.migrate('db/development_data/', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
#     ActiveRecord::Migrator.migrate('../share/current/db/development_data/', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
#
#     puts "#{'*'*(`tput cols`.to_i)}\nThe database has been populated!\n#{'*'*(`tput cols`.to_i)}"
#   end
#
# end

#
#
# namespace :shelter_update do
#   desc "Add shelters to database if they do not exist."
#
#   def log(msg)
#    puts msg
#    Rails.logger.info(msg)
#   end
#
#   task default_positons_0: :environment do
#     log("Starting task to create shelters database.")
#
#     start_time = Time.now
#     successful_records = 0
#     new_records = 0
#     failed_records = 0
#     shelters = Shelter.all
#
#     shelters.each do |shelter|
#       if shelter.name.present?
#         skipped_records += 1
#         log("Skipping shelter #{shelter.id}: shelter already exists.")
#         next
#       end
#
#       if shelter.name.present? == false
#         facade.shelter.new(80202, 2)
#         new_records += 1
#         log("Successfully added a new shelter.")
#       else
#         failed_records += 1
#         log("Failed to add shelter")
#       end
#     end
#
#     log("Task completed in #{Time.now - start_time} seconds. Out of #{shelters.count} total videos, #{successful_records} videos updated successfully; #{new_records} videos skipped; #{failed_records} shifts failed.")
#   end
# end
