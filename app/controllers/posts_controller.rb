class PostsController < ApplicationController
   before_filter :find_post, :only => [ :destroy, :update, :show, :edit ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def update
    
    if @post.update_attributes params[:post]
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  def edit
    @users = User.all
  end

  def create
    @post = Post.new params[:post]

    if @post.valid?
      @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    if @post
      @post.delete
    end
    redirect_to posts_path
  end

  protected

  def find_post
    @post = Post.find params[:id]
  end
end
