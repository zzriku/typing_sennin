class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @range = params[:range]
    if @range == "タイトル"
      @posts = Post.looks(params[:search],params[:word])
    else
      @comments = Comment.looks(params[:search],params[:word])
    end
  end
end