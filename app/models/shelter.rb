class Shelter < ApplicationRecord

validates :place_id, uniqueness: true

geocoded_by :zip
after_validation :geocode, :if => :address_changed?
end
