class SessionsController < ApplicationController
  layout "signup"
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

end
