class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title
  
  belongs_to :user
end
