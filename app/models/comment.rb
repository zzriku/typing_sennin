class Comment < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :post

  validates :title, presence: true
  validates :content, presence: true
end
