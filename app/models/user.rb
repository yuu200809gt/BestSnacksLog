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

  def guest_login
    user = User.find_or_create_by!(email: "guest@example.com") do |u|
      u.password = SecureRandom.urlsafe_base64
      u.name = "ゲストユーザー"
    end
  
    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました"
  end
end
