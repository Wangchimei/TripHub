require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'Registration' do
    before do
      continent = FactoryBot.create(:continent)
      @country = FactoryBot.create(:country, continent: continent)
      @state = FactoryBot.create(:state, country: @country)
      @city = FactoryBot.create(:city, country: @country, state: @state)
      visit new_user_registration_path
      fill_in('user_name', with: 'Test')
      fill_in('user_email', with: 'test@dic.com')
      fill_in('user_password', with: 'testtest')
      fill_in('user_password_confirmation', with: 'testtest')
      select 'Japan', from: 'user_country_id'
      select 'Tokyo', from: 'user[state_id]'
      select 'Shibuya-ku', from: 'user[city_id]'
    end

    it 'cannot access main pages before sign up or login' do
      visit trips_path
      expect(current_path).to eq('/login')
    end

    it 'displays name error messages' do
      fill_in('user_name', with: '')
      click_button '登録'
      expect(page).to have_content('名前を入力してください')
    end

    it 'displays email error messages' do
      fill_in('user_email', with: '')
      click_button '登録'
      expect(page).to have_content('メールアドレスを入力してください')
    end

    it 'displays password error messages' do
      fill_in('user_password', with: '')
      click_button '登録'
      expect(page).to have_content('パスワードを入力してください')
    end

    it 'displays wrong confirmation password error messages' do
      fill_in('user_password_confirmation', with: 'aaaaaaa')
      click_button '登録'
      expect(page).to have_content('確認用パスワードとパスワードの入力が一致しません')
    end

    it 'displays wrong confirmation password error messages' do
      select 'お住まいの国をお選びください', from: 'user[country_id]'
      click_button '登録'
      expect(page).to have_content('国を入力してください')
    end

    it 'is able to create account' do
      click_button '登録'
      expect(page).to have_content('アカウント登録が完了しました。')
    end
  end

  describe 'Login/Logout' do
    before do
      continent = FactoryBot.create(:continent)
      @country = FactoryBot.create(:country, continent: continent)
      @state = FactoryBot.create(:state, country: @country)
      @city = FactoryBot.create(:city, state: @state)
      @user = FactoryBot.create(:user, country: @country, state: @state, city: @city)
      visit new_user_session_path
      fill_in('user_email', with: @user.email)
      fill_in('user_password', with: @user.password)
    end

    it 'failed to login' do
      fill_in('user_password', with:'aaaaaa')
      click_on 'ログイン'
      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end

    it 'successfully login' do
      click_on 'ログイン'
      expect(page).to have_content 'ログインしました。'
    end

    it 'successfully logout' do
      click_on 'ログイン'
      click_on 'navbarDropdownMenuLink'
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end

  describe 'User edit/update and follow' do
    before do
      continent = FactoryBot.create(:continent)
      @country = FactoryBot.create(:country, continent: continent)
      @state = FactoryBot.create(:state, country: @country)
      @city = FactoryBot.create(:city, state: @state)
      @user = FactoryBot.create(:user, country: @country, state: @state, city: @city)
      @second_user = FactoryBot.create(:second_user, country: @country, state: @state, city: @city)
      visit new_user_session_path
      fill_in('user_email', with: @user.email)
      fill_in('user_password', with: @user.password)
      click_on 'ログイン'
    end

    it 'can follow other user after logged in' do
      visit user_path(@second_user)
      click_on 'register-button'
      sleep 0.5
      expect(@user.following.count).to eq 1
    end

    it 'can unfollow other user after logged in' do
      visit user_path(@second_user)
      click_on 'register-button'
      sleep 0.5
      click_on 'register-button'
      sleep 0.5
      expect(@user.following.count).to eq 0
    end

    it 'can change current user profile' do
      visit user_path(@user)
      click_on 'user-edit'
      fill_in('user_name', with: "ToT")
      click_on '保存'
      expect(page).to have_content 'ToT'
    end
  end
end
