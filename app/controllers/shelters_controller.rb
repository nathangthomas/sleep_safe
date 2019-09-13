class SheltersController < ApplicationController

  def show
    @shelter = Shelter.find(params[:id])
  end
end 
