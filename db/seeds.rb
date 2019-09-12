require 'faker'

10.times do
  Event.create!(
    image: Faker::Avatar.image,
    name: Faker::Name.name,
    date: Faker::Date.forward,
    time: '10 AM - 12 PM',
    address: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: '80501',
    description: Faker::Hipster.paragraph  )
end
