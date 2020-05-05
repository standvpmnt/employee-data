class AppraisalHistoriesController < ApplicationController
  before_action :identify_employee

  def create
    @appraisal_history = @employee.appraisal_histories.new(appraisal_history_params)
    if @appraisal_history.save
      redirect_to employee_appraisal_histories_path(@employee), 
                notice: "Appraisal record successfully added"
    else
      render :new, notice: "Error while adding record"
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
      redirect_to employee_appraisal_histories_path(@employee),
                notice: "Appraisal record successfully updated"
    else
      render :edit, notice: "Error while updating record"
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