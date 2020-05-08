class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def approved_user
    if user_signed_in?
      unless current_user.approved
        redirect_to wait_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
