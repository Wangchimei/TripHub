class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[welcome]
  layout 'welcome', only: %i[welcome]

  def welcome
  end

  def dashboard
    # @user = User.find(params[:id])
    Gon.global.visited_countries = visited_countries_array
    @trips = current_user.trips.where(status:0).order(start_day: :asc).limit(3)
  end

  def show
    Gon.global.visited_countries = visited_countries_array
    @user = User.find(params[:id])
    @user_trips= current_user.trips.planning
    @public_trips= @user.trips.open.completed
  end

  def trips
    @trips = current_user.trips
  end
end
