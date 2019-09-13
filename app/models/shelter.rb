class Shelter < ApplicationRecord

validates :place_id, uniqueness: true
validates_presence_of :name, :address, :phone_number, :hours, :latitude, :longitude, :zip

geocoded_by :zip
after_validation :geocode, :if => :address_changed?
end
