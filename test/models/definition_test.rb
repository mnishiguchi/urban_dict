# frozen_string_literal: true

# == Schema Information
#
# Table name: definitions
#
#  id                          :bigint           not null, primary key
#  definition                  :text             not null
#  example                     :text
#  user_id                     :bigint           not null
#  word_id                     :bigint           not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  definition_vote_ups_count   :integer          default(0), not null
#  definition_vote_downs_count :integer          default(0), not null
#

require "test_helper"

class DefinitionTest < ActiveSupport::TestCase
  should belong_to(:user).class_name("User")
  should belong_to(:word).class_name("Word")
  should have_many(:definition_vote_ups).class_name("DefinitionVoteUp")
  should have_many(:definition_vote_downs).class_name("DefinitionVoteDown")

  should validate_presence_of(:definition)
end
