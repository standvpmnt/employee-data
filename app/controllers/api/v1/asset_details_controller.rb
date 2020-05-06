class Api::V1::AssetDetailsController < ApiController

  def show
    @asset_detail = AssetDetail.find(params[:id])
    render json: @asset_detail
  end
end