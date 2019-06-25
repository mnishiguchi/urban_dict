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

class DefinitionVoteTest < ActiveSupport::TestCase
  should belong_to(:user).class_name("User")
  should belong_to(:definition).class_name("Definition")
end
