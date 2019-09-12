class Shelter < ApplicationRecord

geocoded_by :zip
after_validation :geocode, :if => :address_changed?



end
