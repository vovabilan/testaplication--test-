class UsersController < ApplicationController
  before_filter :find_users, :only => [ :destroy, :update, :show, :edit ]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @companies = Company.all
  end
  
  def update
    if @user.update_attributes params[:user]
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def edit
    @companies = Company.all
  end
  def create
    @user = User.new params[:user]
    
    if @user.valid?
      @user.save
      redirect_to users_path
    else
      render :new
    end
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