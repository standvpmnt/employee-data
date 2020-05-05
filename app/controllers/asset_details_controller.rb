class AssetDetailsController < ApplicationController

  def index
    @asset_details = AssetDetail.all
  end


  def new
    @asset_detail = AssetDetail.new
  end

  def create
    @asset_detail = AssetDetail.new(asset_detail_params)
    if @asset_detail.save
      redirect_to asset_details_path, notice:"Asset Type successfuly saved"
    else
      render :new, notice: "Error while adding new record"
    end
  end


  private

  def asset_detail_params
    params.require(:asset_detail).permit(:asset_category, :identifier_type)
  end

end