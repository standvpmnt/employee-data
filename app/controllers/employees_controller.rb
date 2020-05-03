class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]
  
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


  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
