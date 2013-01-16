class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title

  validates :user, :presence => true

  belongs_to :user
end
