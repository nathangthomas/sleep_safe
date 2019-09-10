class ShelterFacade

  def initialize(params)
    @zip_code = params[:q]
    @radius = params[:radius].to_i * 1609.34
  end

  def shelters
    service = GoogleMapsService.new(zip_code, radius)
    service.shelters_by_zip_code
  end
  
  private
  attr_reader :zip_code, :radius
end
