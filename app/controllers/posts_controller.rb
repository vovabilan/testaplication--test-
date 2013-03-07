class PostsController < ApplicationController
  before_filter :find_post, :only => [ :destroy, :update, :show, :edit ]
  before_filter :category, :only => [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update_attributes params[:post]
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  def edit
  end

  def create
    @post = Post.new params[:post].merge!({user: current_user})
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

  def category
    @categories = Category.all
  end
end
