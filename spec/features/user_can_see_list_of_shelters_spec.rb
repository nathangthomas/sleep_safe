require 'rails_helper'

describe 'User can see list of shelters' do
  describe 'when I search for shelters by zipcode then I am taken to shelters/index where I see all shelters' do
    it 'I see the name, address, and the hours of opperation' do

      WebMock.allow_net_connect!

     Shelter.create!(name: "Denver Rescue Mission Lawrence Street Shelter",
        address: "1130 Park Ave W, Denver, CO 80205, USA", phone_number: "(303) 294-0157", hours: "24/7", latitude: "39.75149449999999", longitude: "-104.987716", zip: "80202")

      visit root_path
      within('.navbar') do
        fill_in :q, with: '80202'
        fill_in :radius, with: 10
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
