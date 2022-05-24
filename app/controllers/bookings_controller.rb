class BookingController < ApplicationController
  def index
    @bookings = Booking.all
  end

private

def booking_params
  params.require(:booking).permit(:user_id, :bike_id, :comment, :start_date, :end_date, :status)
end
