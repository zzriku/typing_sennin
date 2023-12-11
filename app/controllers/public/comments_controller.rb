class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(book_comment_params)
    @commnet.post_id = @post.id
    if @comment.save
      redirect_to request.referer
    else
      Rails.logger.error @comment.errors.full_messages
    end
  end

  def destroy
    @post = Post.find(params[:book_id])
    @comment = current_user.comments.find_by(post_id: @post.id)
    @comment.destroy
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
end
