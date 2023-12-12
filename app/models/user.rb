class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :typings, dependent: :destroy
  has_many :scoreboards, dependent: :destroy

  GUEST_USER_EMAIL = "guest@guest.com"

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.handle = "ゲスト"
    end
  end

  #ユーザーのアイコン表示機能
  has_one_attached :image
end