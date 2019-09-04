require 'rails_helper'

describe 'As a User' do
  before :each do
    @shelter_1 = Shelter.create!(name: "Shelter A", phone_number: "303-123-1234")

    @shelter_2 = Shelter.create!(name: "Shelter B", phone_number: "303-321-1234")
    visit root_path
  end

  describe 'I see a link to shelters in the nav bar' do
    it "When I click the link I am taken to the shelters index page" do
      expect(current_path).to eq(root_path)
      click_on "Shelters"
      expect(current_path).to eq(shelters_path)
    end

    it 'I see the name and phone number for each shelter' do
      visit shelters_path
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.phone_number)

      expect(page).to have_content(@shelter_2.name)
      expect(page).to have_content(@shelter_2.phone_number)
    end
  end
end
