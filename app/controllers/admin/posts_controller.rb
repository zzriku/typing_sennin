class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @user = @post.user
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
end
