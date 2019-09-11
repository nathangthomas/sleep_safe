class SheltersCreator
  attr_reader :place_id, :name, :address, :zip, :phone_number, :hours, :lattitude, :longitude

  def initialize(attr={})
    @place_id = place_id
    @name = detailed_shelter_data[:result][:name]
    @address = detailed_shelter_data[:result][:formatted_address]
    @zip = detailed_shelter_data[:result][:formatted_address].split(',')[2].split(' ')[1]
    @phone_number = detailed_shelter_data[:result][:formatted_phone_number]
    @hours = detailed_shelter_data[:result][:opening_hours]
    @latitude = detailed_shelter_data[:result][:geometry][:location][:lat]
    @longitude = detailed_shelter_data[:result][:geometry][:location][:lng]
  end

  def create_shelter(detailed_shelter_data)
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
