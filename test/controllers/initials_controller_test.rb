require 'test_helper'

class InitialsControllerTest < ActionDispatch::IntegrationTest
  test "GET show" do
    get initial_url("A")
    assert_response :success
  end
end
