class Company < ActiveRecord::Base
  attr_accessible :email, :name
  
  validates :name, :presence => true, :length => {:minimum => 2,
    :maximum => 250}
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 5,
    :maximum => 250},
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  has_many :users
  has_many :posts, :through => :users 
end
