require 'faker'

10.times do
  Event.create!(
    name: Faker::Name.name,
    address: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: '80501',
    description: Faker::Hipster.paragraph  )
end
