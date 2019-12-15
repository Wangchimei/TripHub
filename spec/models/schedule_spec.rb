require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @city = FactoryBot.create(:city, state: @state)
    @user = FactoryBot.create(:user, country_id: @country.id, state_id: @state.id, city_id: @city.id)
    @trip = FactoryBot.create(:trip, user_id: @user.id)
    @trip.to_countries.build(country_id: @country.id)
  end

  it 'is invalid without start time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start: '',
      end: DateTime.now + 1,
      trip_id: @trip.id,
      user_id: @user.id,
    )
    expect(trip).not_to be_valid
  end

  it 'is invalid without end time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start: DateTime.now,
      end: '',
      trip_id: @trip.id,
      user_id: @user.id,
    )
    expect(trip).not_to be_valid
  end

  it 'is invalid when end time is before start time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start: DateTime.now - 1,
      end: DateTime.now,
      trip_id: @trip.id,
      user_id: @user.id,
    )
    expect(trip).not_to be_valid
  end




end
