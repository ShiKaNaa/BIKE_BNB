class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_is_after_start_date
  # validates :price, presence: true

  private

  def end_date_is_after_start_date
    if end_date < start_date
      errors.add(:end_date, 'cannot be before the start date')
    end
  end
end
