class Post < ActiveRecord::Base
  attr_accessible :description, :published_at, :title

end
