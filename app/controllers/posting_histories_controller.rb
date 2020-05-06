class PostingHistoriesController < ApplicationController
  before_action :identify_employee

  def create
    @posting_history = @employee.posting_histories.new(posting_history_params)
    if @posting_history.save
      flash[:success] = "Posting record successfully added"
      redirect_to employee_posting_histories_path(@employee)
    else
      a=''
      @posting_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create posting because" + a
      render :new
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
      flash[:success] = "Posting record successfully updated"
      redirect_to employee_posting_histories_path(@employee)
    else
      a=''
      @posting_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't update posting because" + a
      render :edit
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