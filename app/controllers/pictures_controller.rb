class PicturesController < ApplicationController
  before_action :set_trip
  before_action :set_schedule

  def new
    @picture = @schedule.pictures.build
  end

  def create
    @picture = @schedule.pictures.build(picture_params)
    if @picture.save
      params[:picture]['images'].each do |a|
        @picture = @schedule.pictures.create!(images: a,     schedule_id: @schedule.id)
      end
      redirect_to trip_path(@trip)
      flash[:notice] = "写真を追加しました"
    else
      render :new
    end
  end

  def destroy

  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_schedule
    @schedule = @trip.schedules.find(params[:schedule_id])
  end

  def picture_params
    params.require(:picture).permit({images: []})
  end
end
