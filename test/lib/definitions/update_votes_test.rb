# frozen_string_literal: true

require "test_helper"

class Definitions::UpdateVotesTest < ActiveSupport::TestCase
  def setup
    @definition = create(:definition)
    @user = create(:user)
  end

  test "vote up" do
    Definitions::UpdateVotes.call(
      definition: @definition,
      user: @user,
      type: "up"
    )

    assert @user.upvotes.include?(@definition.id)
    assert_not @user.downvotes.include?(@definition.id)
  end

  test "vote down" do
    Definitions::UpdateVotes.call(
      definition: @definition,
      user: @user,
      type: "down"
    )

    assert_not @user.upvotes.include?(@definition.id)
    assert @user.downvotes.include?(@definition.id)
  end

  test "unvote" do
    2.times do
      Definitions::UpdateVotes.call(
        definition: @definition,
        user: @user,
        type: "down"
      )
    end

    assert_not @user.upvotes.include?(@definition.id)
    assert_not @user.downvotes.include?(@definition.id)
  end

  test "with invalid definition" do
    assert_raise StandardError do
      Definitions::UpdateVotes.call(
        definition: Definition.new,
        user: nil,
        type: nil
      )
    end
  end
end
