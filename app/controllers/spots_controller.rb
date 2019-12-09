class SpotsController < ApplicationController
  before_action :set_map_center, only: %i[new]

  def index
    if params[:search].present?
      @spots = Spot.near(params[:search], 30, order: :distance)
    else
      @spots = Spot.all.order(created_at: :desc)
    end
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "spots.csv", type: :csv
      end
    end
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to new_spot_path
      flash[:notice] = "スポットを作成しました"
    else
      render :new
    end
  end

  # def destroy
  #   @spot= Spot.find(params[:id])
  #   @spot.destroy
  #   redirect_to spots_path
  # end

  private
  def spot_params
    params.require(:spot).permit(:name, :address, :admission_fee, :duration, :main_image, :latitude, :longtitude, :formatted_name, :formatted_address, :phone_num, :rating,:website, :place_id)
  end

  def set_map_center
    gon.lat = current_user.country.latitude
    gon.lng = current_user.country.longitude
  end
end
