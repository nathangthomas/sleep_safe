class Event < ApplicationRecord

  def self.sorted
    Event.all.order(:date)
  end


end
