class BookingController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def my_bookings
  end

  def create
  end

  def edit
  end


private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id, :comment, :start_date, :end_date, :status)
  end
end
