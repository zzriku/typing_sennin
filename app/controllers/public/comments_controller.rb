class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to request.referer
    else
      Rails.logger.error @comment.errors.full_messages
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    reidrect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
