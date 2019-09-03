require 'rails_helper'

RSpec.describe "shelters/new", type: :view do
  before(:each) do
    assign(:shelter, Shelter.new())
  end

  it "renders new shelter form" do
    render

    assert_select "form[action=?][method=?]", shelters_path, "post" do
    end
  end
end
