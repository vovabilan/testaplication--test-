class MenusController < ApplicationController

  def index
    @companies = Company.all
    @categories = Category.all
    @posts = Post.all
  end

end

