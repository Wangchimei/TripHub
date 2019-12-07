class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[welcome]
  # before_action :set_visited_countries, except: %i[welcome trips]
  layout 'welcome', only: %i[welcome]

  def welcome
  end

  def dashboard
    # @user = User.find(params[:id])
    Gon.global.visited_countries = visited_countries_array
    @trips = current_user.trips.where(status:0).order(start_day: :asc).limit(3)
  end

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips.order(created_at: :desc)
  end

  def trips
    @trips = current_user.trips
  end
end
