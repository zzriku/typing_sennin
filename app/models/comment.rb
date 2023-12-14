class Comment < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  #いいね数を計算するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @comment = Comment.where("content LIKE?", "#{word}")
    elsif search == "forward_match"
      @comment = Comment.where("content LIKE?","#{word}%")
    elsif search == "backward_match"
      @comment = Comment.where("content LIKE?","%#{word}")
    elsif search == "partical_match"
      @comment = Comment.where("content LIKE?","%#{word}%")
    else
      @comment = Comment.all
    end
  end
end
