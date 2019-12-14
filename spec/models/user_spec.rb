require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @city = FactoryBot.create(:city, state: @state)
    @user = FactoryBot.create(:second_user, country_id: @country.id,
      state_id: @state.id, city_id: @city.id)
  end

  it 'is invalid without a name' do
  user = User.new(
    name: '',
    email: 'shiba@dic.com',
    password: 'shibaa',
    country_id: @country.id,
  )
  expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(
      name: 'Shiba',
      email: '',
      password: 'shibaa',
      country_id: @country.id,
    )
    expect(user).not_to be_valid
  end

  it 'is invalid when a password is less then 6 letters' do
    user = User.new(
      name: 'Shiba',
      email: 'shiba@dic.com',
      password: 'shiba',
      country_id: @country.id,
    )
    expect(user).not_to be_valid
  end

  it 'is invalid without a country id' do
    user = User.new(
      name: 'Shiba',
      email: 'shiba@dic.com',
      password: 'shiba',
      country_id: nil,
    )
    expect(user).not_to be_valid
  end

  it 'is invalid with a duplicate email address' do
    User.create(
      name: 'a',
      email: 'test@example.com',
      password: 'testtest',
      country_id: @country.id,
    )
    user = User.new(
      name: 'b',
      email: 'test@example.com',
      password: '111111',
      country_id: @country.id,
    )
    expect(user).not_to be_valid
  end

  it 'is valid without a state id' do
    user = User.create(
      name: 'Shiba',
      email: 'shiba@dic.com',
      password: 'shibaa',
      country_id: @country.id,
    )
    expect(user).to be_valid
  end

  it 'is valid without a city id' do
    user = User.create(
      name: 'Shiba',
      email: 'shiba@dic.com',
      password: 'shibaa',
      country_id: @country.id,
      state_id: @state.id,
    )
    expect(user).to be_valid
  end

  it 'is valid with all information' do
    user = User.create(
      name: 'Shiba',
      email: 'shiba@dic.com',
      password: 'shibaa',
      country_id: @country.id,
      state_id: @state.id,
      city_id: @city.id,
    )
    expect(user).to be_valid
  end
end