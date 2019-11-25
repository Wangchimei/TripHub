class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update show destroy]
  def index
    @trips = current_user.trips.order(created_at: :desc)
  end

  def new
    @trip = Trip.new
    1.times {@trip.to_countries.build}
    1.times {@trip.to_states.build}
    1.times {@trip.to_cities.build}
    @countries = Country.all
    @states = State.all
    @cities = City.all
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

  def edit; end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path
      flash[:notice] = "トリップが更新されました"
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @trip.destroy
    redirect_to trips_path
    flash[:notice] = "トリップが削除されました"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :trip_image, :start_day, :end_day,:status, :privacy, :est_amount, :user_id, to_countries_attributes: [:id, :country_id, :_destroy], to_states_attributes: [:id, :state_id, :_destroy], to_cities_attributes: [:id, :city_id, :_destroy])
  end
end
