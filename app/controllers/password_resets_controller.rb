class PasswordResetsController < ApplicationController
  layout "signup"

  before_filter :find_user, :only => [:edit, :update]

  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      redirect_to root_url, :notice => t("email1")
    else
      flash.now[:error] = params[:email].blank? ? t('enter') : t('user-does')
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => t("password")
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by_password_reset_token(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = t("password-reset")
      redirect_to root_path
    end
  end
end
