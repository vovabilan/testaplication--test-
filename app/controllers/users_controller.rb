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
    if company.all
      @companies = Company.all
    else
      @user = User.find_by_token(params[:id])
        unless @user.nil?
          @user.activate
          flash[:notice] = 'Registration confirmed'
        end
        redirect_to :root
    end
  end
  
  def create
    @user = User.new params[:user]
    
    if @user.valid?
      @user.save
      redirect_to users_path, :notice => "Success"
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