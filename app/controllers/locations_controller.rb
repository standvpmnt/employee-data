class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location), notice:"Location successfuly saved"
    else
      render :new, notice: "Error while adding new record"
    end
  end


  private

  def location_params
    params.require(:location).permit(:code, :city, :district, :state, :country, :address, :pin_code)
  end
end