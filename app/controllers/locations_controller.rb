class LocationsController < ApplicationController
  skip_before_action :authenticate_user!

  def get_countries
    render partial: 'select_country', locals: {continent_id: params[:continent_id]}
  end

  def get_states
    render partial: 'select_state', locals: {country_id: params[:country_id]}
  end

  def get_cities
    render partial: 'select_city', locals: {state_id: params[:state_id]}
  end

  def to_countries
    @trip = Trip.to_country_build
    @countries = Continent.find(params[:continent_id]).countries.order(name: :asc)
    render partial: "to_countries", layout: false, locals: {countries: @countries}
  end

  def to_states
    @trip = Trip.to_state_build
    @states = Country.find(params[:country_id]).states.order(name: :asc)
    render partial: "to_states", layout: false, locals: {states: @states}
  end

  def to_cities
    @trip = Trip.to_city_build
    @cities = State.find(params[:state_id]).cities.order(name: :asc)
    render partial: "to_cities", layout: false, locals: {cities: @cities}
  end

  def index
  end
end
