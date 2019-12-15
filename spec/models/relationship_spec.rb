require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: continent)
    @state = FactoryBot.create(:state, country: @country)
    @first_user = FactoryBot.create(:user, country: @country, state: @state)
    @second_user = FactoryBot.create(:second_user, country: @country, state: @state)
    @third_user = FactoryBot.create(:third_user, country: @country, state: @state)
    Relationship.create(follower_id: @first_user.id, followed_id: @second_user.id)
  end

  it "is invalid to follow the same user" do
    relationship = Relationship.create(follower_id: @first_user.id, followed_id: @second_user.id)
    expect(relationship).not_to be_valid
  end

  it "is valid to follow other users" do
    relationship = Relationship.create(follower_id: @first_user.id, followed_id: @third_user.id)
    expect(relationship).to be_valid
  end

end
