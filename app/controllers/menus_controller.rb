class MenusController < ApplicationController

  PER_PAGE = 1

  def index
    @companies = Company.all
    @categories = Category.all
    @posts = current_user.posts

    @companies = Company.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)
    @categories = Category.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)
    @posts = Post.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)

  end
end

