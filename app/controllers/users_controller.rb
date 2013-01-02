class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end
  
  def new
    @user = User.new
  end
  
  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to user_path(@user)
    end
  end

  def create
    @user = User.new params[:user]
    if @user
      @user.save
    end
    redirect_to users_path
  end

  def destroy
    @user = User.find params[:id]
    if @user
      @user.delete
    end
    redirect_to users_path
  end
end
