class Category < ActiveRecord::Base
  attr_accessible :company_id, :name

  validates :name, presence: true

  belongs_to :company

end
