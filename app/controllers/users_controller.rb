class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome]
  layout 'welcome', only: [:welcome]

  def welcome
  end

  def dashboard
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips.order(created_at: :desc)
  end
end
