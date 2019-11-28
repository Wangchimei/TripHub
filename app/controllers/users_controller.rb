class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[welcome]
  # before_action :page_refresh, only: %i[show]
  layout 'welcome', only: %i[welcome]

  def welcome
  end

  def dashboard
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @trips = current_user.trips.order(created_at: :desc)
  end

  private

  # def page_refresh
  #   response.setIntHeader("Refresh", 1);
  # end

  # def page_refresh
  #   response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  #   response.headers["Pragma"] = "no-cache"
  #   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  # end
end
