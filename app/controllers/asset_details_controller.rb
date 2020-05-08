class AssetDetailsController < ApplicationController
  before_action :approved_user
  
  def index
    @asset_details = AssetDetail.all
  end


  def new
    @asset_detail = AssetDetail.new
  end

  def create
    @asset_detail = AssetDetail.new(asset_detail_params)
    if @asset_detail.save
      flash[:success] = "Asset Type successfuly saved"
      redirect_to asset_details_path
    else
      a=''
      @asset_detail.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create asset detail because" + a
      render :new
    end
  end


  private

  def asset_detail_params
    params.require(:asset_detail).permit(:asset_category, :identifier_type)
  end

end