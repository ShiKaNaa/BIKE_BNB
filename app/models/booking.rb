class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :start_date, presence: true
  # validates :end_date, comparison: { greater_than: :start_date }
  validates :end_date, presence: true
end
