class Public::FavoritesController < ApplicationController

  def create
    comment = Comment.find(params[:comment_id])
    @favorite = Favorite.create(user_id: current_user.id, comment_id: comment.id)
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    Favorite.find_by(user_id: current_user.id, comment_id: comment.id).destroy
    redirect_to post_path(comment.post)
  end
end
