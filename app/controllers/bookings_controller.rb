
class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = current_user.bookings
    @my_bookings = current_user.my_bookings
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
    if @booking.save
      redirect_to bookings_path, notice: 'Your request has been sent, please wait for the confirmation'
    else
      render :new
    end
    authorize @booking
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = true
    @booking.save!
    redirect_to bookings_path
    authorize @booking
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = false
    @booking.save!
    redirect_to bookings_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :bike_id, :comment, :start_date, :end_date, :status)
  end
end
