class WebhooksController < ActionController::API

  def index
      data = request.params[:zip].first
      response = Shelter.near(data, 100, :order => :distance).limit(3)

      render json: ShelterSerializer.new(response)

  end
end
