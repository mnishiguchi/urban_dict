# frozen_string_literal: true

require "test_helper"

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    create_list(:definition, 3)

    get definitions_url

    assert_response :success
  end
end
