require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spots_new_url
    assert_response :success
  end

  test "should get edit" do
    get spots_edit_url
    assert_response :success
  end

end
