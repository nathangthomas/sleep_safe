require 'yaml'

namespace :import do
   desc "Add shelters to database"
   task shelters: :environment do

    # denver_zipcodes = ["80012", "80014", "80022", "80033", "80123", "80127", "80202", "80203", "80204", "80205", "80206", "80207", "80209", "80210", "80211", "80212", "80214", "80215", "80216", "80218", "80219", "80220", "80221", "80222", "80223", "80224", "80225", "80226", "80227", "80228", "80229", "80230", "80231", "80232", "80233", "80234", "80235", "80236", "80237", "80238", "80239", "80241", "80246", "80247", "80249", "80260", "80264", "80265", "80266", "80290", "80293", "80294", "80299"]

    #Do not use above zipcodes in rake task!!! This will result in duplicate shelters in your database and over 1,000 API calls. Yikes!
    denver_zipcodes = [80202]
    creator = ShelterCreator.new
    creator.populate_shelters(denver_zipcodes)
  end
end
