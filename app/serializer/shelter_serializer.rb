class ShelterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :city, :state, :zip, :hours, :phone_number
end
