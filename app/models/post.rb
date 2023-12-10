class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def update_comment_count
    update(comment_count: comments.count)
  end
end
