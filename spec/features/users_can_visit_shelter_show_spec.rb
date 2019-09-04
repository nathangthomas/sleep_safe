require 'rails_helper'

describe 'As a User' do
  before :each do
    @shelter_1 =   Shelter.create(name: 'Shelter 1',
        hours: '24 Hours',
        website: 'www.shelter.com',
        address: '111 main st',
        city: 'Boulder',
        state: 'CO',
        zip: '80501',
        phone_number: '3031231234'
      )
      visit shelters_path
  end

  describe 'From the shelters index page ' do
    it "I can click a shelter name and am taken to the shelter show page" do
      expect(current_path).to eq(shelters_path)
      click_on "Shelter 1"
      expect(current_path).to eq(shelter_path(@shelter_1))
    end

    it 'I see the name and phone number for each shelter' do
      visit shelter_path(@shelter)
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.phone_number)

      expect(page).to have_content(@shelter_1.website)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
      expect(page).to have_content(@shelter_1.phone_number)
    end
  end
end
