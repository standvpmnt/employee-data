class PostingHistoriesController < ApplicationController
  before_action :identify_employee

  def create
    @posting_history = @employee.posting_histories.new(posting_history_params)
    if @posting_history.save
      redirect_to employee_posting_histories_path(@employee), 
                notice: "Posting record successfully added"
    else
      render :new, notice: "Error while adding record"
    end
  end


  def new
    @posting_history = @employee.posting_histories.new
  end

  def edit
    @posting_history = @employee.posting_histories.find(params[:id])
  end

  def update
    @posting_history = @employee.posting_histories.find(params[:id])
    if @posting_history.update(posting_history_params)
      redirect_to employee_posting_histories_path(@employee),
                notice: "Posting record successfully updated"
    else
      render :edit, notice: "Error while updating record"
    end
  end

  def index
    @posting_histories = @employee.posting_histories.order(start_date: :desc)
  end

  private

    def identify_employee
      @employee = Employee.find(params[:employee_id])
    end

    def posting_history_params
      params.require(:posting_history).permit(:start_date, :end_date, :location_id)
    end

end