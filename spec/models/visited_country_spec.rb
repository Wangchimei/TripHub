require 'rails_helper'

RSpec.describe VisitedCountry, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @user = FactoryBot.create(:user, country: @country, state: @state)
  end

  it "is invalid for duplicate country ids" do
    VisitedCountry.create(user_id: @user.id, country_id: @country.id)
    visited = VisitedCountry.create(user_id: @user.id, country_id: @country.id)
    expect(visited).not_to be_valid
  end

  it "is valid to create visited country" do
    visited = VisitedCountry.create(user_id: @user.id, country_id: @country.id)
    expect(visited).to be_valid
  end
end
