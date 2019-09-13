require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "Validations" do
   it {should validate_presence_of :name}
   it {should validate_presence_of :address}
   it {should validate_presence_of :phone_number}
   it {should validate_presence_of :hours}
   it {should validate_presence_of :latitude}
   it {should validate_presence_of :longitude}
   it {should validate_presence_of :zip}
   it {should validate_uniqueness_of :place_id}
  end
end
