class LocationsController < ApplicationController
  before_action :approved_user

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
      flash[:success]="Location successfuly saved"
      redirect_to location_path(@location)
    else
      a=''
      @location.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create location because" + a
      render :new
    end
  end


  private

  def location_params
    params.require(:location).permit(:code, :city, :district, :state, :country, :address, :pin_code)
  end
end