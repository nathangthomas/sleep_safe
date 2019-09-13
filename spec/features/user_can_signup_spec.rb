require 'rails_helper'

describe 'As a User without an account' do

  describe 'I see a link to signup in nav bar' do
    it "When I click the link I am taken to the user registration poage" do
      visit root_path
      click_on "Sign Up"
      expect(current_path).to eq(new_user_registration_path)
    end

    it 'I fill out a form and click to sign up and a my profile is created' do
      visit new_user_registration_path
       fill_in "First name", with: "Will"
       fill_in "Last name", with: "Thompson"
       fill_in "Phone number", with: "713-851-8023"
       fill_in "Email", with: "wnt9251234@gmail.com"
       fill_in "Password", with: "123456"
       fill_in "Password confirmation", with: "123456"
       click_button "Sign up"
       expect(current_path).to eq("/users/verify")
     end
  end
end
