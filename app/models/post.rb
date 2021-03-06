class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title, :category_ids, :user, :avatar

  validates :title, :presence => true
  validates :published_at, :presence => true

  has_many :render_post_to_categories
  has_many :categories, :through => :render_post_to_categories

  belongs_to :user

  searchable do
    text :title, :boost => 2.0
    text :description
    integer :user_id
  end

end
