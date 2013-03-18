class MenusController < ApplicationController

  PER_PAGE = 1

  def index
    @companies = Company.all.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)
    @categories = Category.all.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)
    @posts = current_user.posts.paginate(:per_page => params[:per_page] || PER_PAGE,
                       :page => params[:page] || 1)

#    paginate(:per_page => params[:per_page] || PER_PAGE,
#                       :page => params[:page] || 1)

  end

end

