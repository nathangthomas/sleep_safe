class Shelter < ApplicationRecord

attr_reader :name, :address, :phone_number, :zip, :hours, :latitude, :longitude
geocoded_by :zip
after_validation :geocode, :if => :address_changed?

def webhook_callback(data)
  self.near(data, 100, :order => :distance).limit(3)

end

end
