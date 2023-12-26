class Scoreboard < ApplicationRecord
  belongs_to :user

  validates :ranking, presence: true
end
