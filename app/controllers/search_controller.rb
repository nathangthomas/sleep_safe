class SearchController < ApplicationController

  def index
    params[:q].present?
    @shelters = Shelter.near(params[:q], search_radius, :order => :distance)
  end

private

  def search_radius
    if params[:radius].present?
      params[:radius]
    else
      2
    end
  end

end
