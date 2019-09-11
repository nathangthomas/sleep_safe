class GoogleMapsService

  def initialize(zip_code, radius)
    @zip_code = zip_code
    @radius = radius
  end

  def coordinates
    conn_params = {"components":"postal_code:#{@zip_code}"}
    response = conn(conn_params).get("https://maps.googleapis.com/maps/api/geocode/json?")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0][:geometry][:location].values.join(",")
  end

  def get_place_ids
    location = coordinates
    conn_params = {"radius": @zip_code, "keyword": "homeless shelter", "location": location}
    response = conn(conn_params).get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?")
    place_ids = JSON.parse(response.body, symbolize_names: true)
    place_ids[:results].map{|shelter| shelter[:place_id]}
  end

  def shelters_by_zip_code
    shelter_place_ids = get_place_ids
    shelter_place_ids.map do |id|
      conn_params = {"placeid": id, "fields": "name,formatted_address,formatted_phone_number,opening_hours,geometry"}
      response = conn(conn_params).get("https://maps.googleapis.com/maps/api/place/details/json?")
      detailed_shelter_data = JSON.parse(response.body, symbolize_names: true)[:result]
      detailed_shelter_data.merge({place_id: id})
    end
  end

  private

  def conn(conn_params)
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
      conn_params.each do |key, value|
        faraday.params[key] = "#{value}"
      end
      faraday.adapter Faraday.default_adapter
    end
  end
end
