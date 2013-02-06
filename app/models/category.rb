class Category < ActiveRecord::Base
  attr_accessible :company_id, :name, :post_ids

  validates :name, presence: true

  belongs_to :company

  has_many :render_post_to_categories
  has_many :posts, :through => :render_post_to_categories
end
