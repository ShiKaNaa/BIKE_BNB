class Bike < ApplicationRecord
  belongs_to :user

  validates :size, inclusion: { in: %w(adult child) }
  validates :name, presence: true
  validates :img_url, presence: true
  validates :category, inclusion: { in: %w(mountain electric road city) }
end
