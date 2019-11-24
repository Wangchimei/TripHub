class TripsController < ApplicationController

  def index

  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to new_trip_daily_path(@trip)
      flash[:notice] = "トリップを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :trip_image, :start_day, :end_day,:status, :privacy, :est_amount, :user_id)
  end
end
