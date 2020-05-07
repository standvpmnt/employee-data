class HomeController < ApplicationController

  def index

  end
  

  def configuration

  end

  def choose
    if params[:location] == "true" && params[:location_id] != '' && params[:location_id] != nil
      @employees = Location.find(params[:location_id]).employees
    elsif params[:location] == "false" && params[:department_id] != '' && params[:department_id] != nil
      @employees = Department.find(params[:department_id]).employees
    end

    respond_to do |format|
      format.js {render partial: 'show_employees'}
      format.html
    end
  end
  
end