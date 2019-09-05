# class ShelterService
#   def shelter_data
#     get_json("/api/alt-fuel-stations/v1/nearest.json?")
#   end
#
#   private
#
# def conn
#   @_conn ||= Faraday.new(url: "https://maps.googleapis.com") do |faraday|
#     faraday.params["key"] = ENV["GOOGLE_PLACES_API_KEY"]
#     faraday.params["input"] = "homeless shelter"
#     faraday.params["inputtype"] = "textquery"
#     faraday.params["fields"] = "name,formatted_address,icon,place_id,types"
#     faraday.adapter Faraday.default_adapter
#   end
# end
#
#   def get_json(url)
#     response = conn.get(url)
#     JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
#   end
# end
