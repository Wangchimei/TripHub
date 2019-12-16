require 'rails_helper'

RSpec.describe "Spots", type: :system do
  before do
    @continent = FactoryBot.create(:continent)
    @country = FactoryBot.create(:country, continent: @continent)
    @state = FactoryBot.create(:state, country: @country)
    @second_country = FactoryBot.create(:second_country, continent: @continent)
    @second_state = FactoryBot.create(:second_state, country: @country)
    @user = FactoryBot.create(:user, country: @country, state: @state)
    @second_user = FactoryBot.create(:second_user, country: @country, state: @state)
    @planning_trip = FactoryBot.create(:trip, user_id: @user.id, to_countries_attributes: [country:  @country], to_states_attributes: [state: @state])
    @finished_private_trip = FactoryBot.create(:finished_private_trip, user_id: @user.id, to_countries_attributes: [country:  @country], to_states_attributes: [state: @state])
    @finished_public_trip = FactoryBot.create(:finished_public_trip, user_id: @second_user.id, to_countries_attributes: [country: @second_country], to_states_attributes: [state: @second_state])
    @spot = FactoryBot.create(:spot)
    UserSpot.create(user_id: @user.id, spot_id: @spot.id)
    visit new_user_session_path
    fill_in('user_email', with: @user.email)
    fill_in('user_password', with: @user.password)
    click_on 'ログイン'
  end

  it 'can create new spot' do
    visit new_spot_path
    sleep 0.5
    fill_in('pac-input', with:'浅草寺')
    find('#pac-input').click
    sleep 0.5
    find('#pac-input').native.send_keys :arrow_down
    find('#pac-input').native.send_keys :enter
    sleep 0.5
    click_on 'commit'
    expect(page).to have_content('スポットを作成しました')
  end

  it 'can unsave spots' do
    visit spots_path
    find('.save-link').click
    sleep 0.5
    expect(@user.saved_spots.count).to eq 0
  end

  it 'can save spots' do
    visit spots_path
    find('.save-link').click
    sleep 0.5
    find('.save-link').click
    sleep 0.5
    expect(@user.saved_spots.count).to eq 1
  end

  it 'can search spots by its lcoations' do
    FactoryBot.create(:second_spot)
    visit spots_path
    fill_in('search', with:'東京')
    find('#search').native.send_keys :enter
    expect(page).not_to have_content('台北101展望台')
  end
end
