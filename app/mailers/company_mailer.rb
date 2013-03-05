class CompanyMailer < ActionMailer::Base
  default from: "noreply@testapplication.com"

  def create(company, user)
    mail(to: user.email, subject: "created a new company: #{company.name}")
  end

end