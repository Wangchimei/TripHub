require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @user = FactoryBot.create(:user, country: @country, state: @state)
    @trip = FactoryBot.create(:trip, user_id: @user.id, to_countries_attributes: [country:  @country])
    @spot = FactoryBot.create(:spot)
  end

  it 'is invalid without start time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start_time: nil,
      end_time: DateTime.now + 1.hour,
      trip_id: @trip.id,
      spot_id: @spot.id,
    )
    expect(schedule).not_to be_valid
  end

  it 'is invalid without end time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start_time: DateTime.now,
      end_time: nil,
      trip_id: @trip.id,
      spot_id: @spot.id,
    )
    expect(schedule).not_to be_valid
  end

  it 'is invalid when the end time is before the start time' do
    schedule = Schedule.new(
      name: '東京タワー',
      start_time: DateTime.now,
      end_time: DateTime.now - 1.hour,
      trip_id: @trip.id,
      spot_id: @spot.id,
    )
    expect(schedule).not_to be_valid
  end

  it 'is valid when info is current' do
    schedule = Schedule.new(
      name: '東京タワー',
      start_time: DateTime.now,
      end_time: DateTime.now + 1.hour,
      trip_id: @trip.id,
      spot_id: @spot.id,
    )
    expect(schedule).to be_valid
  end
end
