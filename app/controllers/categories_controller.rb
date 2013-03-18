class CategoriesController < ApplicationController

  PER_PAGE = 5

  before_filter :require_superadmin_login

  def index
    @search = Category.search do
      fulltext params[:search]
    end

    @categories = @search.results
  end

  def new
    @category = Category.new
    @companies = Company.all
  end

  def create
    @category = Category.new params[:category]
    @companies = Company.all

    if @category.valid?
      @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]

    if @category
      @category.delete
    end
    redirect_to categories_path
  end

end
