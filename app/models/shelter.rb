class Shelter < ApplicationRecord

validates :place_id, uniqueness: true
validates_presence_of :name, :address, :phone_number, :latitude, :longitude

geocoded_by :zip
after_validation :geocode, :if => :address_changed?



end
