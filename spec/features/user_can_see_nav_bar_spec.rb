require 'rails_helper'

describe 'user can see nav bar' do
  describe 'as a user when I visit the welcome page I see a nav bar on the top of the page' do
    describe 'it has a field to search for shelters by zipcode and an optional radius' do
      it 'there is also a search button' do

        visit '/'
        within '.nav-bar'do
          expect(find_field('zip_code').value).to eq 'zip code'
          expect(find_field('radius').value).to eq 'radius'
          expect(page).to have_button("Search")
        end
      end
    end
  end
end
