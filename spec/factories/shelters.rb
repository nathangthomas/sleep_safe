FactoryBot.define do
  factory :shelter do
    name { "Denver Rescue Mission Lawrence Street Shelter" }
    address { "1130 Park Ave W, Denver, CO 80205, USA" }
    phone_number { "(303) 294-0157" }
    hours { "24 Hours" }
    lat { 39.7547561 }
    lng { -104.988042 }
  end
end
