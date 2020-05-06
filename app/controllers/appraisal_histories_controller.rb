class AppraisalHistoriesController < ApplicationController
  before_action :identify_employee

  def create
    @appraisal_history = @employee.appraisal_histories.new(appraisal_history_params)
    if @appraisal_history.save
      flash[:success]="Appraisal record successfully added"
      redirect_to employee_appraisal_histories_path(@employee)
    else
      a=''
      @appraisal_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create record because" + a
      render :new
    end
  end


  def new
    @appraisal_history = @employee.appraisal_histories.new
  end

  def edit
    @appraisal_history = @employee.appraisal_histories.find(params[:id])
  end

  def update
    @appraisal_history = @employee.appraisal_histories.find(params[:id])
    if @appraisal_history.update(appraisal_history_params)
      flash[:success]="Appraisal record successfully updated"
      redirect_to employee_appraisal_histories_path(@employee)
    else
      a=''
      @appraisal_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't update record because" + a
      render :edit
    end
  end

  def index
    @appraisal_histories = @employee.appraisal_histories
  end

  private

    def identify_employee
      @employee = Employee.find(params[:employee_id])
    end

    def appraisal_history_params
      params.require(:appraisal_history).permit(:effective_date, :last_salary, :last_designation, :new_salary,
          :new_designation, :updated_by)
    end

end