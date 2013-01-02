class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname

  def fullname
    "#{firstname} #{lastname}"
  end
end
