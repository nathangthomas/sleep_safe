class WebhooksController < ApplicationController

  def receive
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
    else
      data = params.as_json
    end
    response =  Shelter.near(data, 10, :order => :distance)
  end
end
