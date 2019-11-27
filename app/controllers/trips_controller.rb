class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update show destroy]
  before_action :set_location, only: %i[new edit]

  def index
    @trips = Trip.where(privacy: true).order(created_at: :desc)
  end

  def new
    @trip = Trip.new

  end

  def create
    @trip = current_user.trips.build(trip_params)

    if @trip.save
      redirect_to trip_user_spots_path(@trip)
      flash[:notice] = "トリップを作成しました"
    else
      render :new
    end
  end

  def edit
    gon.set_start_day = @trip.start_day
    gon.set_end_day = @trip.end_day
  end

  def update
    if @trip.update(trip_params)
      redirect_to user_path(current_user)
      flash[:notice] = "トリップが更新されました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @trip.destroy
    redirect_to user_path(current_user)
    flash[:notice] = "トリップが削除されました"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def set_location
    @countries = Country.limit(2)
    @states = State.limit(2)
    @cities = City.limit(2)
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :trip_image, :start_day, :end_day,:status, :privacy, :est_amount, :user_id, to_countries_attributes: [:id, :country_id, :_destroy], to_states_attributes: [:id, :state_id, :_destroy], to_cities_attributes: [:id, :city_id, :_destroy])
  end
end