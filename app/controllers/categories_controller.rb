class CategoriesController < ApplicationController

  before_filter :require_superadmin_login

  def index
    @categories = Category.all
    @categories = Category.search(params[:search], params[:page])
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
