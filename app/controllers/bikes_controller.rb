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

    # on va récupérer les start_date, end_date et status de chaque bike
    @my_bikes.each do |bike|
      if bike.bookings.count < 1
        bike.available = true
      else
        bike.bookings.each do |booking|
          # on verifie que un bike a un booking sinon ne peut pas afficher
          @start_date = booking.start_date
          @end_date = booking.end_date
          @status_booking = booking.status
          @all_dates = (@start_date..@end_date).map { |date| date.strftime("%a %d %b %Y").to_s }
          @someday = Date.today.strftime("%a %d %b %Y").to_s

          if @all_dates.include?(@someday) && (@status_booking == "Accepted ✅")
            bike.available = false
            bike.save
          end
        end
      end
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
    @bike.destroy!
    redirect_to my_bikes_path, notice: 'Bike was successfully destroyed.'
  end

  private

  def bike_params
    params.require(:bike).permit(:user_id, :name, :img_url, :size, :category, :available, :price, :photo, :city)
  end
end


          # bike.available = false if (@someday == @all_dates) && (@status_booking == "Accepted ✅")


        # on itère car plusieurs bookings possible sur un bike
        # bike.bookings.each do |booking|
        #   # on verifie que un bike a un booking sinon ne peut pas afficher
        #   @start_date = booking.start_date
        #   @end_date = booking.end_date
        #   @status_booking = booking.status
        #   @all_dates = (@start_date..@end_date).map { |date| date.strftime("%a %d %b %Y") }
        #   @someday = Date.today
        #   # j'ai changé le nom de |bike| a |bike_status| pour éviter doublon
        #   @my_bikes.each do |bike_status|
        #     @available = bike_status.available == false
        #     return @available if (@someday == @all_dates) && (@status_booking == "Accepted ✅")
        #   end
        # end
