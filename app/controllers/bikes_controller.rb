class BikesController < ApplicationController
  require 'date'

  def index
    if params[:query].present?
      @bikes = policy_scope(Bike.where("city ILIKE ?", "%#{params[:query]}%")).order(created_at: :desc)
    else
      @bikes = policy_scope(Bike).order(created_at: :desc)
    end
  end

  def my_bikes
    @my_bikes = Bike.where(user_id: current_user.id)
    authorize @my_bikes
    @my_bikes.each do |bike|
      bike.bookings.each do |booking|
        @start_date = booking.start_date
        @end_date = booking.end_date
        @status_booking = booking.status
      end
    end
    @all_dates = (@start_date..@end_date).map { |date| date.strftime("%a %d %b %Y") }
    @someday = Date.today
    @my_bikes.each do |bike|
      @available = bike.available == false
      return @available if (@someday == @all_dates) && (@status_booking == "Accepted ✅")
    end
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bikes_path, notice: 'Bike advert was successfully created.'
    else
      render :new
    end
    authorize @bike
  end

  def edit
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to my_bikes_path
    authorize @bike
  end

  def destroy
    @bike = Bike.find(params[:id])
    authorize @bike
    @bike.destroy
    redirect_to my_bikes_path, notice: 'Bike was successfully destroyed.'
  end

  private

  def bike_params
    params.require(:bike).permit(:user_id, :name, :img_url, :size, :category, :available, :price, :photo, :city)
  end
end
