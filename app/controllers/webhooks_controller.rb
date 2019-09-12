class WebhooksController < ActionController::API
  def receive
      data = request.body
      response = {response.body: Shelter.near(data.read, 1000000, :order => :distance).limit(3)}
      binding.pry
  end

end
