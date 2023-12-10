class Public::PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
      #@comment.save.update_comment_count
      flash[:notice] = 'successfully'
      redirect_to post_path(@post)
    #else
      #flash[:alert] = 'error'
      #@post =
    #end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :comment_count)
  end
end
