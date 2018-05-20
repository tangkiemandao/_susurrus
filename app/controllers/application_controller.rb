class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You need to login as adminstrator"
      redirect_to admin_root_path
    end
  end
end
