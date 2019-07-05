# frozen_string_literal: true

# == Schema Information
#
# Table name: definition_votes
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  definition_id :bigint           not null
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class DefinitionVoteDownTest < ActiveSupport::TestCase
  def setup
    @definition = create(:definition)
    @user = create(:user)
  end

  test "vote down" do
    DefinitionVoteDown.vote(definition: @definition, user: @user)

    assert_not @user.upvotes.include?(@definition.id)
    assert @user.downvotes.include?(@definition.id)
  end

  test "unvote" do
    2.times do
      DefinitionVoteDown.vote(definition: @definition, user: @user)
    end

    assert_not @user.upvotes.include?(@definition.id)
    assert_not @user.downvotes.include?(@definition.id)
  end

  test "with invalid definition" do
    assert_raise StandardError do
      DefinitionVoteDown.vote(definition: Definition.new, user: nil)
    end
  end
end
