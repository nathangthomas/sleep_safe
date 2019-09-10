
require 'rails_helper'

describe GoogleMapsService do
  context "instance methods" do
    context "shelters by zip_code" do
      it "returns homeless shelter data" do
        search = subject.shelters_by_zip_code("80203", "2")
        expect(search).to be_a Array
        # expect(search.count).to eq(10)
        shelter_data = search[0]

        expect(shelter_data).to have_key :name
        expect(shelter_data).to have_key :formatted_address
        expect(shelter_data).to have_key :formatted_phone_number
        expect(shelter_data).to have_key :opening_hours
        expect(shelter_data).to have_key :geometry
      end
    end
  end
end
