class Shelter
  attr_reader :name, :address, :phone_number, :hours, :lat, :lng

  def initialize(attr = {})
    @name = attr[:name]
    @address = attr[:formatted_address]
    @phone_number = attr[:formatted_phone_number]
    @hours = attr[:opening_hours]
    @lat = attr[:geometry][:location][:lat]
    @lng = attr[:geometry][:location][:lng]
  end
end
