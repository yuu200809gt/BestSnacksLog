class Snack < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_snacks, through: :likes, source: :snack
  validates :name, presence: true
  validates :best_alcohol, presence: true
  validates :food_types, presence: true
  validates :memo, presence: true

  has_one_attached :food do |attachable|
  attachable.variant :index_size, resize_to_fill: [260, 200]
  end
end
