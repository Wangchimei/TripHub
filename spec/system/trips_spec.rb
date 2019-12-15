require 'rails_helper'

RSpec.describe "Trips", type: :system do
  describe 'Trip' do
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
      visit new_user_session_path
      fill_in('user_email', with: @user.email)
      fill_in('user_password', with: @user.password)
      click_on 'ログイン'
    end

    it 'displays error message with no name input' do
      visit new_trip_path
      fill_in('trip_name', with: "")
      fill_in('trip_description', with: "Fun")
      fill_in('date-range-picker', with: "2019-12-15 00:00 - 2019-12-15 23:59")
      click_on 'Apply'
      target = "option[value='" + @continent.id.to_s + "']"
      find(target).click
      select @country.name, from: 'trip_to_countries_attributes_0_country_id'
      select @state.name, from: 'trip_to_states_attributes_0_state_id'
      click_on 'commit'
      expect(page).to have_content('タイトルを入力してください')
    end

    it 'displays error message with no country input' do
      visit new_trip_path
      fill_in('trip_name', with: "Fun")
      fill_in('trip_description', with: "Fun")
      fill_in('date-range-picker', with: "2019-12-15 00:00 - 2019-12-15 23:59")
      click_on 'Apply'
      target = "option[value='" + @continent.id.to_s + "']"
      find(target).click
      click_on 'commit'
      expect(page).to have_content('旅行先を入力してください')
    end

    it 'can successfully create trips' do
      visit new_trip_path
      fill_in('trip_name', with: "Fun")
      fill_in('trip_description', with: "Fun")
      fill_in('date-range-picker', with: "2019-12-15 00:00 - 2019-12-15 23:59")
      click_on 'Apply'
      target = "option[value='" + @continent.id.to_s + "']"
      find(target).click
      select @country.name, from: 'trip_to_countries_attributes_0_country_id'
      select @state.name, from: 'trip_to_states_attributes_0_state_id'
      click_on 'commit'
      expect(page).to have_content('トリップを作成しました')
    end

    it 'can edit trips when the trip status is planning' do
      visit edit_trip_path(@planning_trip)
      fill_in('trip_name', with: "Fun Yeah")
      click_on 'commit'
      expect(page).to have_content('トリップが更新されました')
    end

    it 'can only be edited by trip creater' do
      visit edit_trip_path(@finished_public_trip)
      expect(page).to have_content('権限がありません')
    end

    it 'cannot edit trips when the trip status is finished' do
      visit edit_trip_path(@finished_private_trip)
      expect(page).to have_content('この旅行もう終わりましたので、編集できません')
    end

    it 'can delete trips' do
      visit trips_user_path(@user)
      details_area = ".show_details_" + @planning_trip.id.to_s
      delete_btn = "#delete_" + @planning_trip.id.to_s
      find(details_area).hover
      find(delete_btn).click
      page.accept_alert
      expect(page).to have_content('トリップが削除されました')
    end

    it 'shows only public and finished trips on index' do
      visit trips_path
      expect(page).to have_content('TAIWAN')
    end
  end
end