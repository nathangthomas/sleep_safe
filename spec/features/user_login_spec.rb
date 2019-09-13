require 'rails_helper'

describe 'As a registered User' do
  before :each do
    WebMock.allow_net_connect!
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Will"
    fill_in "Last name", with: "Thompson"
    fill_in "Phone number", with: "713-851-8023"
    fill_in "Email", with: "wnt925@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"
  end
  describe 'I see a link to logout in nav bar' do
    it "When I click the link to logout I am logged out" do
      expect(current_path).to eq(verify_path)
      click_on "Log Out"
      expect(page).to have_content('You are now Logged out.')
      expect(current_path).to eq(root_path)
    end

    describe 'I see a link to Login in nav bar' do
    it 'When I click the button I am taken to a Log in page' do
      click_on "Log Out"

      click_on "Log In"

       fill_in "Email", with: "wnt925@gmail.com"
       fill_in "Password", with: "123456"
       click_button "Login"

       expect(current_path).to eq(dashboard_path)
     end
   end
  end
end
