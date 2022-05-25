class Bike < ApplicationRecord
  belongs_to :user

  SIZE = ["adult", "child"]
  CATEGORY = ["mountain", "electric", "road", "city"]

  validates :size, inclusion: { in: SIZE }
  validates :name, presence: true
  validates :price, presence: true
  validates :img_url, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
