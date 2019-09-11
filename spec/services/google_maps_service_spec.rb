
require 'rails_helper'

describe GoogleMapsService do
  context "instance methods" do
    context "shelters by zip_code" do
      it "returns homeless shelter data" do
        WebMock.allow_net_connect!
        service = GoogleMapsService.new("80202", 3218.68)
        shelters = service.shelters_by_zip_code
        expect(shelters).to be_a Array
        expect(shelters.count).to eq(20)
        shelter_data = shelters[0]

        expect(shelter_data[:name]).to be
        expect(shelter_data[:address]).to be
        expect(shelter_data[:phone_number]).to be
        expect(shelter_data[:hours]).to be
        expect(shelter_data[:latitude]).to be
        expect(shelter_data[:longitude]).to be
      end
    end
  end
end
