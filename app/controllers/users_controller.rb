class UsersController < ApplicationController
  before_filter :find_users, :only => [ :destroy, :update, :show, :edit ]
  def index
    @users = User.all
  end

  def show
    
  end

  def edit

  end
  
  def new
    @user = User.new
  end
  
  def update
    if @user.update_attributes params[:user]
      redirect_to user_path(@user)
    else
      render :edit
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
    if @user
      @user.delete
    end
    redirect_to users_path
  end

  protected

  def find_users
    @user = User.find params[:id]
  end

end