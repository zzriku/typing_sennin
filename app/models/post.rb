class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  def update_comment_count
    update(comment_count: comments.count)
  end
end
