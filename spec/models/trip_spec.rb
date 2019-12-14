require 'rails_helper'

RSpec.describe Trip, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @city = FactoryBot.create(:city, state: @state)
    @user = FactoryBot.create(:user, country_id: @country.id, state_id: @state.id, city_id: @city.id)
  end

  it 'is invalid without a name' do
    trip = Trip.new(
      name: '',
      start_day: DateTime.now,
      end_day: DateTime.now + 1,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).not_to be_valid
  end

  it 'is invalid when start day is greater than end day' do
    trip = Trip.new(
      name: 'Trip',
      start_day: DateTime.now,
      end_day: DateTime.now - 1,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).not_to be_valid
  end

  it 'is valid when info is current' do
    trip = Trip.new(
      name: 'Trip',
      start_day: DateTime.now,
      end_day: DateTime.now + 1,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).to be_valid
  end
end
