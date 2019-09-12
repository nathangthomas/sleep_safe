require 'rails_helper'

RSpec.describe ShelterCreator, type: :model do
  it "creates a shelter record" do
    shelter_data = {
      :formatted_address=>"1130 Park Ave W, Denver, CO 80205, USA",
      :formatted_phone_number=>"(303) 294-0157",
      :geometry=>
      {:location=>{:lat=>39.7547561, :lng=>-104.988042},
      :viewport=>{:northeast=>{:lat=>39.7561801302915, :lng=>-104.9867449697085}, :southwest=>{:lat=>39.75348216970851, :lng=>-104.9894429302915}}},
      :name=>"Denver Rescue Mission Lawrence Street Shelter",
      :opening_hours=>
        {:open_now=>true,
         :periods=>
          [{:close=>{:day=>0, :time=>"2200"}, :open=>{:day=>0, :time=>"0530"}},
           {:close=>{:day=>1, :time=>"2200"}, :open=>{:day=>1, :time=>"0530"}},
           {:close=>{:day=>2, :time=>"2200"}, :open=>{:day=>2, :time=>"0530"}},
           {:close=>{:day=>3, :time=>"2200"}, :open=>{:day=>3, :time=>"0530"}},
           {:close=>{:day=>4, :time=>"2200"}, :open=>{:day=>4, :time=>"0530"}},
           {:close=>{:day=>5, :time=>"2200"}, :open=>{:day=>5, :time=>"0530"}},
           {:close=>{:day=>6, :time=>"2200"}, :open=>{:day=>6, :time=>"0530"}}],
         :weekday_text=>
          ["Monday: 5:30 AM – 10:00 PM",
           "Tuesday: 5:30 AM – 10:00 PM",
           "Wednesday: 5:30 AM – 10:00 PM",
           "Thursday: 5:30 AM – 10:00 PM",
           "Friday: 5:30 AM – 10:00 PM",
           "Saturday: 5:30 AM – 10:00 PM",
           "Sunday: 5:30 AM – 10:00 PM"]},
      :place_id=>"ChIJ6zlkGd94bIcR6dgyevG_u0c"
    }
    creator = ShelterCreator.new

    shelter = creator.create_record(shelter_data)

    expect(shelter[:name]).to be
    expect(shelter[:address]).to be
    expect(shelter[:phone_number]).to be
    expect(shelter[:hours]).to be
    expect(shelter[:latitude]).to be
    expect(shelter[:longitude]).to be
    expect(shelter[:zip]).to be
    expect(shelter[:place_id]).to be
  end
end
