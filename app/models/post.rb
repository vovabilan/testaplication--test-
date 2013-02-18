class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title, :category_ids, :user, :avatar

  validates :title, :presence => true

  has_many :render_post_to_categories
  has_many :categories, :through => :render_post_to_categories

  belongs_to :user
 
end
