class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def liked_comments
    @liked_comments = Comment.liked_comments(current_user, params[:page], 12)
  end

  private

  def user_params
    params.require(:user).permit(:handle, :image)
  end
end