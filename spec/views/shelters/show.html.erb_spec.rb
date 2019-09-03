require 'rails_helper'

RSpec.describe "shelters/show", type: :view do
  before(:each) do
    @shelter = assign(:shelter, Shelter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
