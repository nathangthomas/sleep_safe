class GoogleMapsService

  def initialize(zip_code, radius)
    @zip_code = zip_code
    @radius = radius
  end

  def coordinates
    conn_params = {"components":"postal_code:#{@zip_code}"}
    data = get_json(conn_params, "https://maps.googleapis.com/maps/api/geocode/json?")[:results]
    data[0][:geometry][:location].values.join(",")
  end

  def get_place_ids
    conn_params = {"radius": @zip_code, "keyword": "homeless
    shelter", "location": coordinates}
    place_ids = get_json(conn_params, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?")[:results]
    place_ids.map{|shelter| shelter[:place_id]}
  end

  def shelters_by_zip_code
    shelter_place_ids = get_place_ids
    shelter_place_ids.map do |id|
      conn_params = {"placeid": id, "fields": "name,formatted_address,formatted_phone_number,opening_hours,geometry"}
      detailed_shelter_data = get_json(conn_params, "https://maps.googleapis.com/maps/api/place/details/json?")[:result]
      detailed_shelter_data.merge({place_id: id})
    end
  end

  private

  def get_json(conn_params, url)
    response = conn(conn_params).get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

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
