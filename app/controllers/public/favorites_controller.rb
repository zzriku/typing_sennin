class Public::FavoritesController < ApplicationController

  def create
    @comment = Comment.find(params[:comment_id])
    favorite = @comment.favorites.new(user: current_user)
    #favorite = current_user.favorites.new(comment_id: comment.id)
    favorite.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    favorite = @comment.favorites.find_by(user: current_user)
    #favorite = current_user.favorites.find_by(comment_id: comment.id)
    favorite.destroy if favorite
    redirect_to post_path(@comment.post)
  end
end
