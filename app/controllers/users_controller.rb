class UsersController < ApplicationController
  def get_states
    render partial: 'select_state', locals: {country_id: params[:country_id]}
  end

  def get_cities
    render partial: 'select_city', locals: {state_id: params[:state_id]}
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
