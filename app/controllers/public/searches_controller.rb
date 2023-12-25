class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "タイトル"
      @posts = Post.looks(params[:search],params[:word])
    else
      @comments = Comment.looks(params[:search],params[:word])
    end

    if @word.blank?
      flash[:alert] = "検索ワードを入力してください。"
      redirect_to request.referer and return
    end
  end
end