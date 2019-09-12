class Shelter < ApplicationRecord

attr_reader :name, :address, :phone_number, :zip, :hours, :latitude, :longitude, :place_id
validates :place_id, uniqueness: true

geocoded_by :zip
after_validation :geocode, :if => :address_changed?
end
