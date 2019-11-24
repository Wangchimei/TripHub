class DailiesController < ApplicationController
  before_action :set_trip

  def index

  end

  def new
    @daily = Daily.new
  end

  def create
    @daily = @trip.dailies.build(daily_params)
    if @daily.save
      redirect_to trips_path
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
    @trip = Trip.find(params[:trip_id])
  end

  def daily_params
    params.require(:daily).permit(:date, :start_time, :end_time, :trip_id)
  end
end
