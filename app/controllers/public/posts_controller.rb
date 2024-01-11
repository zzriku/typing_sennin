class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @posts = Post.all
    @user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'successfully'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'error'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @user = @post.user
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :comment_count)
  end
end
