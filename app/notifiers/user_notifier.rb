class PygmentsWorker
  include Sidekiq::Worker
    
  sidekiq_options retry: false

  def invite(params)
    users = User.where(id: params['user_ids'])
    admin = User.find(params['admin_id'])
    users.each do |user|
      UserMailer.send(:invite, user, admin).deliver
      UserMailer.send_registration_mail(email, name).deliver
    end
  end

  def admin_invite(params)
    user = User.find(params['user_id'])
    UserMailer.send(:admin_invite, user).deliver
    UserMailer.send_registration_mail(email, name).deliver
  end
end
