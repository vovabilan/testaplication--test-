class CategoriesController < ApplicationController

  before_filter :require_superadmin_login

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find params[:id]

    if @category
      @category.delete
    end
    redirect_to categories_path
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
  
  def new
    @category = Category.new
    @companies = Company.all
  end
end
