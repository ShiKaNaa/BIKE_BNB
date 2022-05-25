class Bike < ApplicationRecord
  belongs_to :user

  # line for cloudinary
  has_one_attached :photo

  SIZE = ["adult", "child"]
  CATEGORY = ["mountain", "electric", "road", "city"]

  validates :size, inclusion: { in: SIZE }
  validates :name, presence: true
  validates :price, presence: true

  # j'ai mis en commentaire la ligne du dessous pour test cloudinary
  # validates :img_url, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
