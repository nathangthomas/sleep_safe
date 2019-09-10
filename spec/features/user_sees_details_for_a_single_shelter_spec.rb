require 'rails_helper'

describe 'User can info for a single shelter' do
  describe 'when I visit the index page and click on a shelter I am taken to the show page for that shelter' do
    it 'where I see the name, address, phone number, hours of opperation, and a map' do

      visit root_path
      within('.navbar') do
        fill_in :q, with: '80202'
        click_button 'Search'
      end

      click_link 'Denver Rescue Mission Lawrence Street Shelter'

      expect(current_path).to eq(shelter_path)

      expect(page).to have_css(".name")
      expect(page).to have_css(".hours_of_operation")
      expect(page).to have_css(".phone_number")
      expect(page).to have_css(".address")
      #test for map!!!
    end
  end
end
