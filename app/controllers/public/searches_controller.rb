class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    if @range == "タイトル"
      @posts = Post.looks(params[:search],params[:word])
    else
      @comments = Comment.looks(params[:search],params[:word])
    end
  end
end