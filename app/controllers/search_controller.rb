class SearchController < ApplicationController
  def index
     render locals: {
       facade: ShelterFacade.new(params[:q])
     }
  end
end
