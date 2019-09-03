require 'rails_helper'

RSpec.describe "shelters/edit", type: :view do
  before(:each) do
    @shelter = assign(:shelter, Shelter.create!())
  end

  it "renders the edit shelter form" do
    render

    assert_select "form[action=?][method=?]", shelter_path(@shelter), "post" do
    end
  end
end
