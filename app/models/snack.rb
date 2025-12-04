class Snack < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_snacks, through: :likes, source: :snack
end
