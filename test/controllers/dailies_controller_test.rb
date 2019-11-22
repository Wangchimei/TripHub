require 'test_helper'

class DailiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dailies_new_url
    assert_response :success
  end

  test "should get edit" do
    get dailies_edit_url
    assert_response :success
  end

end
