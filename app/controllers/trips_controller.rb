class TripsController < ApplicationController
  before_action :set_trip, only: %i[edit update show destroy toggle_status toggle_privacy]
  before_action :set_location, only: %i[new edit]
  before_action :set_chart_latlng, only: %i[edit]

  def index
    @trips = Trip.where(privacy:false).order(created_at: :desc)
    # @trips = Trip.open.completed.other_than(current_user).order(created_at: :desc)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      redirect_to trip_schedules_path(@trip)
      flash[:notice] = "トリップを作成しました"
    else
      render :new
    end
  end

  def edit
    gon.start_day = @trip.start_day
    gon.end_day = @trip.end_day
  end

  def update
    if @trip.update(trip_params)
      redirect_to user_path(current_user)
      flash[:notice] = "トリップが更新されました"
    else
      render :edit
    end
  end

  def toggle_status
    @countries = @trip.destination_countries
    if @trip.planning?
      @trip.finished!
      current_user.visited!(@countries) if not_been_to?(@countries)
    elsif @trip.finished?
      @finshed_trips = current_user.trips.where(status:1)
      current_user.unvisited!(@countries) if only_one_record?(@finshed_trips)
      @trip.planning!
    end
    redirect_to user_path(current_user)
  end

  def toggle_privacy
    @trip.toggle!(:privacy)
    redirect_to user_path(current_user)
  end

  def show
    @schedules = @trip.schedules
  end

  def destroy
    @trip.destroy
    redirect_to user_path(current_user)
    flash[:notice] = "トリップが削除されました"
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  def set_location
    @countries = Country.limit(2)
    @states = State.limit(2)
    @cities = City.limit(2)
  end

  def trip_params
    params.require(:trip).permit(:name, :description, :trip_image, :start_day, :end_day,:status, :privacy, :est_amount, :user_id, to_countries_attributes: [:id, :country_id, :_destroy], to_states_attributes: [:id, :state_id, :_destroy], to_cities_attributes: [:id, :city_id, :_destroy])
  end

  def not_been_to?(countries)
    VisitedCountry.find_by(user_id: current_user.id, country_id:countries.first.id).nil?
  end

  def only_one_record?(finished_trips)
    counts = 0
    finished_trips.each do |trip|
      counts += trip.destination_countries.where(id: @trip.destination_countries.first.id).count
    end
    counts == 1
  end

  def set_chart_latlng
    gon.home_name = current_user.country.name
    gon.home_lat = current_user.country.latitude
    gon.home_lng = current_user.country.longitude
    gon.des_name = @trip.destination_countries.first.name
    gon.des_lat = @trip.destination_countries.first.latitude
    gon.des_lng = @trip.destination_countries.first.longitude
  end
end