class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title

  validates :user, :presence => true, :length => { :minimum => 2, :maximum => 180 }

  belongs_to :user
end
