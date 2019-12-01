class SpotsController < ApplicationController
  def index
    @spots = Spot.all
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
      redirect_to spots_path
      flash[:notice] = "スポットを作成しました"
    else
      render :new
    end
  end

  def destroy
    @spot= Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :admission_fee, :duration, :main_image, :latitude, :longtitude, :address, :formatted_name, :phone_num, :rating,:website, :place_id)
  end
end
