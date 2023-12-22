class Admin::FavoritesController < ApplicationController
  before_action :authenticate_admin!
  def create
    comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.new(comment_id: comment.id)
    favorite.save
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    favorite = current_user.favorites.find_by(comment_id: comment.id)
    favorite.destroy
    redirect_to post_path(comment.post)
  end
end
