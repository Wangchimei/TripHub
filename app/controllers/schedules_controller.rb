class SchedulesController < ApplicationController
  before_action :set_trip, except: %i[destroy]
  before_action :set_js_variables, except: %i[destroy]
  before_action :set_schedule, only: %i[edit update show destroy]

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

  def destroy
    @schedule.destroy
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :start, :end, :admission_fee, :other_cost, :duration, :note, :trip_id, :spot_id)
  end

  def set_js_variables
    gon.trip_id = @trip.id
    gon.start_day = @trip.start_day.beginning_of_day
    gon.end_day = @trip.end_day.end_of_day
    gon.lat = current_user.country.latitude
    gon.lng = current_user.country.longitude
  end
end