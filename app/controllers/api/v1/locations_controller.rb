class Api::V1::LocationsController < ApiController
  before_action :set_location, only: [:show]
  
  def index
    @locations = Location.all
  end

  def show
    @employee = @location.employees.first
    render json: @location, include: [:employees]
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

end