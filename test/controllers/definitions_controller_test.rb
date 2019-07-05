# frozen_string_literal: true

require "test_helper"

class DefinitionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = create(:user)
    sign_in @user
  end

  test "should get index" do
    definition = create(:definition)

    get definitions_url(word: definition.word)

    assert_response :success
  end

  test "should get new" do
    get new_definition_url

    assert_response :success
  end

  test "should post create" do
    post definitions_url(definition: {
                           word: "Rn",
                           definition: "Laboriosam tempore facere possimus.",
                           example: "Animi porro neque illo.",
                           tag_names: "ruby,rails"
                         })

    assert_redirected_to definitions_path(word: Definition.last.word)
  end

  test "should get edit" do
    definition = create(:definition, user: @user)

    get edit_definition_url(definition)

    assert_response :success
  end

  test "should patch update" do
    definition = create(:definition, user: @user)

    patch definition_url(definition.id, definition: {
                           word: "Rn",
                           definition: "Laboriosam tempore facere possimus.",
                           example: "Animi porro neque illo.",
                           tag_names: "ruby,rails"
                         })

    assert_redirected_to definitions_path(word: Definition.last.word)
  end
end
