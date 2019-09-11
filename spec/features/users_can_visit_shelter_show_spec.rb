require 'rails_helper'

describe 'As a User' do
  before :each do
    WebMock.allow_net_connect!

   @shelter_1 = Shelter.create!(name: "Denver Rescue Mission Lawrence Street Shelter",
      address: "1130 Park Ave W, Denver, CO 80205, USA", phone_number: "(303) 294-0157", hours: "24/7", latitude: "39.75149449999999", longitude: "-104.987716", zip: "80202")
  end

  describe 'From the shelters index page ' do


    it 'I see the name and phone number for each shelter' do
      visit shelter_path(@shelter_1)
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.phone_number)

      # expect(page).to have_content(@shelter_1.website)
      # expect(page).to have_content(@shelter_1.address)
      # expect(page).to have_content(@shelter_1.city)
      # expect(page).to have_content(@shelter_1.state)
      # expect(page).to have_content(@shelter_1.zip)
      expect(page).to have_content(@shelter_1.phone_number)
    end
  end
end
