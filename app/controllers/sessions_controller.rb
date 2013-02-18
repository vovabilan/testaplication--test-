class SessionsController < ApplicationController
  layout "signup"
  
  skip_before_filter :require_login
  before_filter :reqire_logined_user, only: [:new, :create]

  def create
    user = User.find_by_email(params[:email])
    if user && !user.activated?
      flash.now[:error] = t('.your-account-not-activated')
      render :new
    elsif user && user.authenticate(params[:password])
      params[:remember_me] ? cookies.permanent[:auth_token] = user.auth_token : cookies[:auth_token] = user.auth_token
      redirect_to companies_url, :notice => t(".logged-in")
    else
      flash.now[:error] = t(".email-or-password")
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => t(".logged-out")
  end

  private
  
  def reqire_logined_user
    redirect_to companies_path if current_user
  end
end
