class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  #コメント数を計算するメソッド
  def update_comment_count
    update(comment_count: comments.count)
  end

  #いいね数を計算するメソッド
  #def favorited_by?(user)
    #favorites.exists?(user_id: user.id)
  #end
end
