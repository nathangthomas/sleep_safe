
require 'rails_helper'

describe GoogleMapsService do
  subject = GoogleMapsService.new('80202', 2)
  context "instance methods" do
    context "shelters by zip_code" do
      it "returns homeless shelter data" do
        # WebMock.allow_net_connect!
         stub_google_maps_api_calls

        shelters = subject.shelters_by_zip_code
        expect(shelters).to be_a Array
        expect(shelters.count).to eq(1)
        shelter_data = shelters[0]

        expect(shelter_data[:name]).to be
        expect(shelter_data[:formatted_address]).to be
        expect(shelter_data[:formatted_phone_number]).to be
        expect(shelter_data[:opening_hours]).to be
        expect(shelter_data[:geometry][:location][:lat]).to be
        expect(shelter_data[:geometry][:location][:lng]).to be
        expect(shelter_data[:place_id]).to be
      end
    end
  end
end
