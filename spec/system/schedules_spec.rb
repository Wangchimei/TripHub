require 'rails_helper'

RSpec.describe "Schedules", type: :system do
  before do
    driven_by(:rack_test)
  end
    # it 'cannot add feedback and pics before finishing the trip' do
    #   visit trips_user_path(@user)

    #   expect(page).to have_content('権限がありません')
    # end

    # it 'can add feedback and pics after finishing the trip' do
    #   visit trips_user_path(@user)

    #   expect(page).to have_content('権限がありません')
    # end

  pending "add some scenarios (or delete) #{__FILE__}"
end
