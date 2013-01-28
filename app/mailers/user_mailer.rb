class UserMailer < ActionMailer::Base
  default from: "noreply@testapplication.com"

  def confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Confirm registration"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
