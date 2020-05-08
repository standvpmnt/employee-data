class AssetsController < ApplicationController
  before_action :approved_user
  before_action :identify_employee

  def create
    @asset = @employee.assets.new(asset_params)
    @asset.in_store = false
    if @asset.save
      flash[:success]="Asset successfully added to employee"
      redirect_to employee_assets_path(@employee)
    else
      a=''
      @asset.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create asset because" + a
      render :new
    end
  end


  def new
    @asset = @employee.assets.new
  end

  def index
    @assets = @employee.assets
    @asset_detail = AssetDetail.all
  end

  private

    def identify_employee
      @employee = Employee.find(params[:employee_id])
    end

    def asset_params
      params.require(:asset).permit(:asset_detail_id, :asset_identifier, :note, :updated_by, tags: [])
    end

end