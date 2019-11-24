require 'test_helper'

class UserSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get userspots_index_url
    assert_response :success
  end

  test "should get new" do
    get userspots_new_url
    assert_response :success
  end

  test "should get edit" do
    get userspots_edit_url
    assert_response :success
  end

  test "should get show" do
    get userspots_show_url
    assert_response :success
  end

end
