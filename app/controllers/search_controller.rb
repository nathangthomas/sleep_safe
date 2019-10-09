class SearchController < ApplicationController

  def index
    if not_in_denver?
      redirect_to root_path, notice: "This demo currently only works for valid Denver zipcodes. Please enter a Denver zipcode. Sorry for the inconvience."
    elsif valid
    @shelters = Shelter.near(params[:q], search_radius, :order => :distance)
    else
      redirect_to root_path, alert: "Please enter a valid 5 digit zipcode."
    end
  end

private
  def search_radius
    if params[:radius].present?
      params[:radius]
    else
      2
    end
  end

  def valid
    params[:q].present? && params[:q].length == 5 && params[:q].split("").all? {|i| (48..57).include?(i.ord)}
  end


  def not_in_denver?
    denver_zipcodes = ["80012", "80014", "80022", "80033", "80123", "80127", "80202", "80203", "80204", "80205", "80206", "80207", "80209", "80210", "80211", "80212", "80214", "80215", "80216", "80218", "80219", "80220", "80221", "80222", "80223", "80224", "80225", "80226", "80227", "80228", "80229", "80230", "80231", "80232", "80233", "80234", "80235", "80236", "80237", "80238", "80239", "80241", "80246", "80247", "80249", "80260", "80264", "80265", "80266", "80290", "80293", "80294", "80299"]

    in_denver = denver_zipcodes.include?(params[:q])
    params[:q].length == 5 && params[:q].split("").all? {|i| (48..57).include?(i.ord)} && in_denver == false
  end
end
