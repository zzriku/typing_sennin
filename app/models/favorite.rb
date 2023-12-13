class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :user_id, uniqueness: {scope: :comment_id} #一人のユーザーが一つのコメントに複数いいねを押せないようにする機能
end
