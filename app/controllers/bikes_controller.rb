class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def my_bikes

  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create

  end

  def destroy

  end

  private

  def bike_params
    params.require(:bike).permit(:user_id, :name, :image_url, :size, :category, :available)
  end
end
