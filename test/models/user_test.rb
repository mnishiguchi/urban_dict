# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class UserTest < ActiveSupport::TestCase
  should have_many(:definitions).class_name("Definition")
  should have_many(:definition_vote_ups).class_name("DefinitionVoteUp")
  should have_many(:definition_vote_downs).class_name("DefinitionVoteDown")

  # should validate_presence_of(:username)
  # should validate_presence_of(:email)
end
