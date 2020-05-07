class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end


  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success]="Department successfuly saved"
      redirect_to departments_path
    else
      a=''
      @departments.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create document because" + a
      render :new
    end
  end


  private

  def department_params
    params.require(:department).permit(:name)
  end

end