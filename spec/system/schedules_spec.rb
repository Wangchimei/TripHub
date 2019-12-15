require 'rails_helper'

RSpec.describe "Schedules", type: :system do
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

  it 'can create a new schedule' do
    # UserSpot.create(user_id: @user.id, spot_id: @spot.id)
    visit trip_schedules_path(@planning_trip)
    find('.fc-add_event-button').click
    fill_in('date-range-picker', with: "2019-12-15 10:00 - 2019-12-15 14:00")
    click_on 'Apply'
    click_on 'commit'
    expect(page).to have_content('東京タワー')
  end

  it 'can edit an existing schedule' do
    schedule = FactoryBot.create(:schedule, trip_id: @planning_trip.id, spot_id: @spot.id)
    visit trip_schedules_path(@planning_trip)
    find(".fc-event").click
    fill_in('date-range-picker', with: "2019-12-15 06:00 - 2019-12-15 14:00")
    click_on 'Apply'
    click_on 'commit'
    expect(page).to have_content('6:00 - 2:00')
  end

  it 'can delete an existing schedule' do
    schedule = FactoryBot.create(:schedule, trip_id: @planning_trip.id, spot_id: @spot.id)
    visit trip_schedules_path(@planning_trip)
    find(".fc-event").click
    sleep 0.5
    find(".delete-btn").click
    page.accept_alert
    sleep 0.5
    expect(page).not_to have_content('東京タワー')
  end

  it 'can edit schedules when the trip status is planning' do
    visit trip_schedules_path(@planning_trip)
    path = "/trips/" + @planning_trip.id.to_s + "/schedules"
    expect(current_path).to eq(path)
  end

  it 'cannot edit schedules when the trip status is finished' do
    visit trip_schedules_path(@finished_private_trip)
    expect(page).to have_content('この旅行もう終わりましたので、編集できません')
  end
end
