class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    # Faire une dépendance de bikes :id
  end

  def create
  end

  def update
    # Accept ou Decline to change status
  end


private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id, :comment, :start_date, :end_date, :status)
  end
end
