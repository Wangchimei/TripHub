require 'rails_helper'

RSpec.describe Trip, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @city = FactoryBot.create(:city, country: @country, state: @state)
    @user = FactoryBot.create(:user, country: @country, state: @state, city: @city)
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

  it 'is invalid without a start day' do
    trip = Trip.new(
      name: 'Trip',
      start_day: nil,
      end_day: DateTime.now + 1,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).not_to be_valid
  end

  it 'is invalid without a end day' do
    trip = Trip.new(
      name: 'Trip',
      start_day: DateTime.now,
      end_day: nil,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).not_to be_valid
  end

  it 'is invalid when the end day is before the start day' do
    trip = Trip.new(
      name: 'Trip',
      start_day: DateTime.now,
      end_day: DateTime.now - 1,
      user_id: @user.id,
    )
    to_countries = trip.to_countries.build(country_id: @country.id)
    expect(trip).not_to be_valid
  end

  it 'is invalid without country input' do
    trip = Trip.new(
      name: 'Trip',
      start_day: DateTime.now,
      end_day: DateTime.now + 1,
      user_id: @user.id,
    )
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
