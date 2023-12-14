class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  #コメント数を計算するメソッド
  def update_comment_count
    update(comment_count: comments.count)
  end

  #ユーザーのアイコン表示機能
  has_one_attached :image

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partical_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  #いいね数を計算するメソッド
  #def favorited_by?(user)
    #favorites.exists?(user_id: user.id)
  #end
end
