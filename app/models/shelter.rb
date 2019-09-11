class Shelter < ApplicationRecord

attr_reader :name, :address, :phone_number, :zip, :hours, :latitude, :longitude
geocoded_by :zip
after_validation :geocode, :if => :address_changed?
end
