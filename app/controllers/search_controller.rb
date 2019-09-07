class SearchController < ApplicationController
  def index
     render locals: {
       facade: ShelterFacade.new(params)
     }
  end
end
