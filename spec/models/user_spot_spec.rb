require 'rails_helper'

RSpec.describe UserSpot, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @user = FactoryBot.create(:user, country: @country, state: @state)
    @spot = FactoryBot.create(:spot)
  end

  it "is invalid to save the same spot" do
    UserSpot.create(user_id: @user.id, spot_id: @spot.id)
    user_spot = UserSpot.create(user_id: @user.id, spot_id: @spot.id)
    expect(user_spot).not_to be_valid
  end

  it "is valid to save a spot" do
    user_spot = UserSpot.create(user_id: @user.id, spot_id: @spot.id)
    expect(user_spot).to be_valid
  end
end
