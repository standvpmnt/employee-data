class AttendanceHistoriesController < ApplicationController
  before_action :approved_user
  before_action :identify_employee

  def create
    @attendance_history = @employee.attendance_histories.new(attendance_history_params)
    if @attendance_history.save
      flash[:success]="Attendance record successfully added"
      redirect_to employee_attendance_histories_path(@employee)
    else
      a=''
      @attendance_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't create attendance record because" + a
      render :new
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
      flash[:success] = "Attendance record successfully updated"
      redirect_to employee_attendance_histories_path(@employee)
    else
      a=''
      @attendance_history.errors.full_messages.each { |m| a += "\n" + m }
      flash.now[:alert] = "Couldn't update attendance record because" + a
      render :edit
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