# frozen_string_literal: true

require "test_helper"

class UnknownWordsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    sign_in @user
  end

  test "should get index" do
    get unknown_words_url

    assert_response :success
  end

  test "should get new" do
    get new_unknown_word_url

    assert_response :success
  end

  test "should post create" do
    post unknown_words_url(unknown_word: {
                             word: "Rn",
                             memo: "Laboriosam tempore facere possimus."
                           })

    assert_redirected_to unknown_words_path
  end
end
