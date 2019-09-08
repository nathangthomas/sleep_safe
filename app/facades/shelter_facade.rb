class ShelterFacade

  def initialize(zip_code=nil)
    @zip_code = zip_code
    conncect = TwilioService.new
    @twilio = connect.exporting_data[:q]
  end

  def coordinates
    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
      faraday.params["components"] = "postal_code:#{@zip_code}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("https://maps.googleapis.com/maps/api/geocode/json?")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0][:geometry][:location].values.join(",")
  end


  def shelter_place_ids
    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
      faraday.params["radius"] = 3218
      faraday.params["keyword"] = "homeless shelter"
      faraday.params["location"] = coordinates
      faraday.adapter Faraday.default_adapter
    end

    basic_response = conn.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?")
    basic_shelter_data = JSON.parse(basic_response.body, symbolize_names: true)
    basic_shelter_data[:results].map{|shelter| shelter[:place_id]}
  end


  def shelters
    shelter_place_ids.map do |i|
      conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
        faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
        faraday.params["placeid"] = i
        faraday.params["fields"] = "name,formatted_address,formatted_phone_number,opening_hours,geometry"
        faraday.adapter Faraday.default_adapter
      end
      detailed_response = conn.get("https://maps.googleapis.com/maps/api/place/details/json?")
      detailed_shelter_data = JSON.parse(detailed_response.body, symbolize_names: true)
      Shelter.new(detailed_shelter_data[:result])
    end
  end
end
