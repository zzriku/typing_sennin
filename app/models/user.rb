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

  scope :latest, -> { order(created_at: :desc) }


  GUEST_USER_EMAIL = "guest@guest.com"

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.handle = "ゲスト"
    end
  end

  #ゲストログアウト機能
  def guest?
    email == GUEST_USER_EMAIL
  end

  #アカウント退会後ユーザーは瞬時にログインできなくなる
  def active_for_authentication?
    super && account_active?
  end

  #ユーザーのアイコン表示機能
  has_one_attached :image

  #いいねしたコメントを表示
  def self.liked_comments(user, page, per_page)
  includes(:favorites)
    .where(favorites: { user_id: user.id })
    .order(created_at: :desc)
    .page(page)
    .per(per_page)
  end
end