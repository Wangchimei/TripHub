class LocationsController < ApplicationController
  skip_before_action :authenticate_user!
  def get_states
    render partial: 'select_state', locals: {country_id: params[:country_id]}
  end

  def get_cities
    render partial: 'select_city', locals: {state_id: params[:state_id]}
  end

  def index
  end
end
