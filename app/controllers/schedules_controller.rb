class SchedulesController < ApplicationController
  before_action :set_trip
  before_action :set_schedule, only: %i[edit update show destroy]

  def index
    gon.trip_id = @trip.id
    gon.start_day = @trip.start_day
    gon.end_day = @trip.end_day
    gon.cal_end_day = @trip.end_day+1
  end

  def new
    @schedule = Schedule.new
    @saved_spots = current_user.saved_spots
  end

  def create
    @schedule = @trip.schedules.build(schedule_params)
    @schedule.save
  end

  def edit; end

  def update
    @schedule.update(schedule_params)
  end

  def destroy
    @schedule.destroy
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :date_range, :start, :end, :admission_fee, :other_cost, :duration, :note, :trip_id, :spot_id)
  end
end