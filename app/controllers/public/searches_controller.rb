class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @search = params[:word]
    if @range == "User"
      @posts = Post.looks(params[:search],params[:word])
    else
      @comments = Comment.looks(params[:search],params[:word])
    end
  end
end