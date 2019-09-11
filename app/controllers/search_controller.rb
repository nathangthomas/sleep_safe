class SearchController < ApplicationController

  def index
    params[:q].present?
    @shelters = Shelter.near(params[:q], params[:radius], :order => :distance)
  end

end
