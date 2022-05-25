
class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
    authorize @booking
    # Faire une dépendance de bikes :id
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @user = current_user
    @booking.bike = @bike
    @booking.user = @user
    @booking.status = false

    if @booking.save!
      redirect_to bookings_path, notice: 'Your request has been sent, please wait for the confirmation'
    else
      render :new
    end
    authorize @booking
  end

  def update
    # Accept ou Decline to change status
  end


private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id, :comment, :start_date, :end_date, :status)
  end
end
