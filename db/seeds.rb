require 'faker'

10.times do
  Shelter.create!(
    name: Faker::Name.name,
    hours: '24 Hours',
    website: Faker::Internet.url,
    address: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: '80501',
    latitude: 40.1733,
    longitude: -105.1142,
    phone_number: '3031231234'
  )
end
