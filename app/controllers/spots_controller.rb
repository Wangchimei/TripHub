class SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(trip_params)
    if @spot.save
      redirect_to new_trip_daily_path(@trip)
      flash[:notice] = "スポットを作成しました"
    else
      render :new
    end
  end

  def destroy
    @spot= Spot.find(params[:id])
    @spot.destroy
    redirect_to new_trip_daily_path(@trip)
  end
end
