require 'rails_helper'

RSpec.describe Spot, type: :model do
  it 'is invalid without a name' do
    spot = Spot.new(
      name: '',
      address: '東京都港区芝公園４丁目２−８',
      latitude: 35.6585805,
      longitude: 139.7454329,
      place_id: "a",
    )
    expect(spot).not_to be_valid
  end

  it 'is invalid without an address' do
    spot = Spot.new(
      name: '東京タワー',
      address: '',
      latitude: 35.6585805,
      longitude: 139.7454329,
      place_id: "a",
    )
    expect(spot).not_to be_valid
  end

  it 'is invalid for duplicate place ids' do
    FactoryBot.create(:spot)
    spot = Spot.new(
      name: 'test',
      address: 'test',
      latitude: 35,
      longitude: 139,
      place_id: "ChIJCewJkL2LGGAR3Qmk0vCTGkg",
    )
    expect(spot).not_to be_valid
  end

  it 'is valid with required fields' do
    FactoryBot.create(:spot)
    spot = Spot.new(
      name: '後楽園ホール',
      address: '東京都文京区後楽１丁目３−６１',
      latitude: 35.704259,
      longitude: 139.7520446,
      place_id: "ChIJrTs5XEeMGGARwSdc3mdD5T0",
    )
    expect(spot).to be_valid
  end
end