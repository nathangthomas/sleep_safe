class ShelterCreator

  def create_record(shelter_data)
    name = shelter_data[:name]
    address = shelter_data[:formatted_address]
    zip = shelter_data[:formatted_address].split(',')[2].split(' ')[1]
    phone_number = shelter_data[:formatted_phone_number]
    hours = shelter_data[:opening_hours]
    lat = shelter_data[:geometry][:location][:lat]
    lng = shelter_data[:geometry][:location][:lng]
    place_id = shelter_data[:place_id]
    Shelter.create!(name: name, address: address, phone_number: phone_number, hours: hours, latitude: lat, longitude: lng, zip: zip, place_id: place_id)
  end

  def populate_shelters(zip_codes)
    zip_codes.each do |zip|
      service = GoogleMapsService.new(zip, 16093.4)
      service.shelters_by_zip_code.map do |shelter_data|
        create_record(shelter_data)
      end
    end
  end

end
