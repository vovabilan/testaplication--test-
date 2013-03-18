class Company < ActiveRecord::Base
  attr_accessible :email, :name, :avatar
  
  validates :name, :presence => true, :length => {:minimum => 2,
    :maximum => 250}
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 5,
    :maximum => 250},
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  has_many :users
  has_many :posts, :through => :users
  has_many :categories

  after_create :send_email_for_users

  searchable do
    text :name, :boost => 2.0
  end

  def send_email_for_users
    User.without_supper_admin.each do |user|
      CompanyMailer.create(self, user).deliver
    end
  end
  
end
