class BikesController < ApplicationController
  def index
    @bikes = policy_scope(Bike).order(created_at: :desc)
  end

  def my_bikes
    @my_bikes = Bike.where(user_id: current_user.id)
    authorize @my_bikes
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
