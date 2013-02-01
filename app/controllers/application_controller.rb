class ApplicationController < ActionController::Base
  layout "application"

  protect_from_forgery

  before_filter :require_login
  
  private

  def is_supper_admin?
    current_user.supper_admin == true
  end
  helper_method :is_supper_admin?

  def current_user
    @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  private

  def require_login
    unless current_user
      flash[:error] = t("you-must-be-logged")
      redirect_to root_path
    end
  end

  def require_superadmin_login
    redirect_to posts_path unless is_supper_admin?
  end

  def authorize
    redirect_to new_session_path, :error => t("not-authorized") if current_user.nil?
  end
end
