class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :snacks
  has_many :likes, dependent: :destroy
  has_many :liked_snacks, through: :likes, source: :snack
  has_one_attached :avatar

  validates :name, presence: true

  def self.guest_sign_in
    find_or_create_by!(email: "guestr3@example.com") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
