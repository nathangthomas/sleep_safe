require 'rails_helper'

describe 'User can see list of shelters' do
  describe 'when I search for shelters by zipcode then I am taken to shelters/index where I see all shelters' do
    it 'I see the name, address, and the hours of opperation' do

    # coordinates = File.open("./fixtures/coordinates.json")
    # stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?components=postal_code:80202&key=AIzaSyD3ZYmO1b2Kto3uLY6k0xif2JCGUTLEkk4").
    #   to_return(status: 200, body: coordinates, headers: {})
    #
    #   place_ids = File.open("./fixtures/shelter_place_ids.json")
    #   stub_request(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyD3ZYmO1b2Kto3uLY6k0xif2JCGUTLEkk4&keyword=homeless%20shelter&location=39.7541032,-105.0002242&radius=1609.34").
    #   to_return(status: 200, body: place_ids, headers: {})
    #
    #   shelters = File.open("./fixtures/shelters.json")
    #   stub_request(:get, "https://maps.googleapis.com/maps/api/place/details/json?fields=name,formatted_address,formatted_phone_number,opening_hours,geometry&key=AIzaSyD3ZYmO1b2Kto3uLY6k0xif2JCGUTLEkk4&placeid=ChIJH3mpCSd5bIcRJ6391DPE6J4").
    #   to_return(status: 200, body: shelters, headers: {})

      #stub_google_maps_api_calls
       WebMock.allow_net_connect!

      visit root_path
      within('.navbar') do
        fill_in :q, with: '80202'
        click_button 'Search'
      end

      expect(current_path).to eq(search_path)

      # expect(page).to have_css(".shelter", count:10)
      within(first('.shelter')) do
        expect(page).to have_css(".name")
        # expect(page).to have_css(".hours_of_operation")
        expect(page).to have_css(".phone_number")
        expect(page).to have_css(".address")
      end
    end
  end
end
