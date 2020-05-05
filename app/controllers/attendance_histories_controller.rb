class AttendanceHistoriesController < ApplicationController
  before_action :identify_employee

  def create
    @attendance_history = @employee.attendance_histories.new(attendance_history_params)
    if @attendance_history.save
      redirect_to employee_attendance_histories_path(@employee), 
                notice: "Attendance record successfully added"
    else
      render :new, notice: "Error while adding record"
    end
  end


  def new
    @attendance_history = @employee.attendance_histories.new
  end

  def edit
    @attendance_history = @employee.attendance_histories.find(params[:id])
  end

  def update
    @attendance_history = @employee.attendance_histories.find(params[:id])
    if @attendance_history.update(attendance_history_params)
      redirect_to employee_attendance_histories_path(@employee),
                notice: "Attendance record successfully updated"
    else
      render :edit, notice: "Error while updating record"
    end
  end

  def index
    @attendance_histories = @employee.attendance_histories
  end

  private

    def identify_employee
      @employee = Employee.find(params[:employee_id])
    end

    def attendance_history_params
      params.require(:attendance_history).permit(:start_date, :end_date, :working_days, :casual_leaves, :sick_leaves,
          :half_days, :week_offs, :updated_by)
    end

end