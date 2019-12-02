class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[welcome]
  # before_action :page_refresh, only: %i[show]
  layout 'welcome', only: %i[welcome]

  def welcome
  end

  def dashboard
    # @user = User.find(params[:id])
    @trips = current_user.trips.where(status:0).order(created_at: :desc).limit(5)
  end

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips.order(created_at: :desc)
  end
end
