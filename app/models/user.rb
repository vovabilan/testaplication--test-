class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname
  
  validates :firstname, :presence => true, :length => {:minimum => 2,
    :maximum => 250}
  validates :lastname, :presence => true, :length => {:minimum => 2,
    :maximum => 250}
  validates :email, :uniqueness => true, :presence => true, :length => {:minimum => 5,
    :maximum => 250},
    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
  def fullname
    "#{firstname} #{lastname}"
  end
end
