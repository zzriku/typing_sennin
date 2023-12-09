class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GUEST_USER_EMAIL = "guest@guest.com"
  
  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.handle = "ゲスト"
    end
  end
    
  #ユーザーのアイコン用
  has_one_attached :image
end