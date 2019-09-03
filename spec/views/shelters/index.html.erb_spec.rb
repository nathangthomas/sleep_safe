require 'rails_helper'

RSpec.describe "shelters/index", type: :view do
  before(:each) do
    assign(:shelters, [
      Shelter.create!(),
      Shelter.create!()
    ])
  end

  it "renders a list of shelters" do
    render
  end
end
