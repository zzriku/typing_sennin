class Comment < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  #いいね数を計算するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
