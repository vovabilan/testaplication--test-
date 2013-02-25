class UsersController < ApplicationController
  layout "signup"

  skip_before_filter :require_login
  before_filter :company, :only => [ :new, :create ]
  
  def new
    @user = User.new
    @user = User.create( params[:user] )
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path, :notice => "Success"
    else
      render :new
    end
  end

  def edit
    if current_user
      @user = current_user
    else
      @user = User.find_by_token(params[:id])
      unless @user.nil?
        @user.activate
        flash[:notice] = 'Registration confirmed'
      end
      redirect_to :root
    end
  end

  def company
    @companies = Company.all
  end
end
