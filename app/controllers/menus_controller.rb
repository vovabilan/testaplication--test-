class MenusController < ApplicationController

  def index
    @companies = Company.all
    @categories = Category.all
    @posts = current_user.posts
    
  end

end

