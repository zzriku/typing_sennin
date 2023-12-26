class Public::ScoreboardsController < ApplicationController
  
  def index
    @scores = Score.order(ranking: :desc).limit(25)
  end

  def create
    @score = current_user.scores.build(score_params)

    if @score.save
      redirect_to root_path, notice: 'スコアが保存されました！'
    else
      redirect_to root_path, aleart: 'スコアの保存に失敗しました'
    end
  end


  private


  def score_params
    params.require(:score).permit(:ranking)
  end
end


