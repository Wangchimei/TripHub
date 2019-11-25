class UserSpotsController < ApplicationController

  def index
  end

  def create
    @spot = Spot.find(params[:id])
    admission_fee = @spot.admission_fee
    @user_spot = current_user.user_spots.create!(admission_fee: admission_fee, spot_id: @spot.id)
    flash[:notice] = "スポットを保存しました"
  end

  def destroy
    @user_spot = UserSpot.find(params[:id])
    @user_spot.destroy
    redirect_to request.referrer
    flash[:notice] = "保存したスポットを削除しました"
  end

  private

  def set_user_spot
  end

  def user_spots_params
  end
end
