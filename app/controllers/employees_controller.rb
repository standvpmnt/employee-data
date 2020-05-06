class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update]
  
  def index
    if params[:search].blank?
      @employees = Employee.where(active: true).page params[:page]
      @blank = true
    else
      @employees = Employee.locator(params[:search]).page params[:page]
    end

    respond_to do |format|
      format.js {render partial: 'show_employees'}
      format.html
    end
  end

  def show
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = "Employee Record updated successfully!"
      redirect_to employee_path(@employee)
    else
      a=''
      @employee.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't update record because" + a
      render :edit
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee created successfully"
      redirect_to employee_path(@employee)
    else
      a=''
      @employee.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't update record because" + a
      render :new
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :dob, :gender, :blood_group, :personal_contact_no,
                :personal_email, :location_id, :employee_code, :current_designation, :date_of_joining,
              :father_name, :mother_name, :emergency_contact_no, :emergency_contact_name,
              :emergency_contact_relation, :official_email, :local_address, :permanent_address, :isManager,
              :manager_id, :notes, :photo, :active, :date_of_leaving)
  end
end
