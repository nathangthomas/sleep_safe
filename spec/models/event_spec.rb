require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
   it {should validate_presence_of  :first_name}
   it {should validate_presence_of :last_name}
   it {should validate_presence_of :phone_number}
   it {should validate_presence_of :email}
   it {should validate_presence_of :password}
  end
end
