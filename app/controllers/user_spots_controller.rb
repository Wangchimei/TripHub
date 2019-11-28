class UserSpotsController < ApplicationController
  before_action :set_trip, only: [:index, :show]

  def index
    gon.start_day = @trip.start_day
    gon.end_day = @trip.end_day
    gon.cal_end_day = @trip.end_day+1
  end

  def create
    @spot = Spot.find(params[:id])
    admission_fee = @spot.admission_fee
    @user_spot = current_user.user_spots.create!(admission_fee: admission_fee, spot_id: @spot.id)
    flash[:notice] = "スポットを保存しました"
  end

  def edit
  end

  def update
  end
  
  def destroy
    @user_spot = UserSpot.find(params[:id])
    @user_spot.destroy
    redirect_to request.referrer
    flash[:notice] = "保存したスポットを削除しました"
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_user_spot

  end
end
