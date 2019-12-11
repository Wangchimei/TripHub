class SchedulesController < ApplicationController
  before_action :set_trip, except: %i[destroy]
  before_action :set_schedule, except: %i[index new create]
  before_action :set_js_variables, except: %i[destroy]

  def index
    @schedules = @trip.schedules
  end

  def new
    @schedule = @trip.schedules.build
    @saved_spots = current_user.saved_spots
  end

  def create
    @schedule = @trip.schedules.build(schedule_params)
    @schedule.save
  end

  def edit
    @saved_spots = current_user.saved_spots
  end

  def update
    @schedules = @trip.schedules
    @schedule.update(schedule_params)
  end

  def edit_details
  end

  def update_details
    if @schedule.update(schedule_params)
      redirect_to trip_path(@trip)
      flash[:notice] = "写真を追加しました"
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_schedule
    @schedule = @trip.schedules.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :date_range, :start, :end, :admission_fee, :other_cost, :duration, :note, :trip_id, :spot_id, {images: []})
  end

  def set_js_variables
    gon.trip_id = @trip.id
    gon.trip_country_lat = @trip.destination_countries.first.latitude
    gon.trip_country_lng = @trip.destination_countries.first.latitude
    if @trip.destination_states.first
      gon.trip_state_lat = @trip.destination_states.first.latitude
      gon.trip_state_lng = @trip.destination_states.first.longitude
    end
    gon.start_day = @trip.start_day.beginning_of_day
    gon.end_day = @trip.end_day.end_of_day.end_of_day
    gon.cal_end_day = @trip.end_day + 1
    gon.lat = current_user.country.latitude
    gon.lng = current_user.country.longitude
  end
end