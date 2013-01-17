class CategoriesController < ApplicationController
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
    
    if @category.valid?
      @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def new
    @category = Category.new
  end
end
