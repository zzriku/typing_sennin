class Typing < ApplicationRecord
  #has_many: :scoreboards, dependent: :destroy
  belongs_to :user
end
