# frozen_string_literal: true

require "test_helper"

class WordsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in create(:user)
  end

  test "should get index" do
    create_list(:definition, 3)

    get words_url

    assert_response :success
  end
end
