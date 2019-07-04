# frozen_string_literal: true

require "test_helper"

class Definitions::VotesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in create(:user)
  end

  test "POST create" do
    definition = create(:definition)

    post definition_votes_url(definition_id: definition.id, type: :up), xhr: true

    assert_response :success
  end
end
