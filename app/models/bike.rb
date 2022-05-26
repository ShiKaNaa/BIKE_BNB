class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # line for cloudinary
  has_one_attached :photo

  SIZE = ["adult", "child"]
  CATEGORY = ["mountain", "electric", "road", "city"]

  validates :size, inclusion: { in: SIZE }
  validates :name, presence: true
  validates :price, presence: true
  validates :city, presence: true

  # j'ai mis en commentaire la ligne du dessous pour test cloudinary
  # validates :img_url, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
