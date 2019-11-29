require 'test_helper'

class VisitedCountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get visited_countries_create_url
    assert_response :success
  end

  test "should get destroy" do
    get visited_countries_destroy_url
    assert_response :success
  end

end
