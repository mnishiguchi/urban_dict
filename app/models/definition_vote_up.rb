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

class DefinitionVoteUp < DefinitionVote
  class << self
    def vote(user:, definition:)
      definition_vote = DefinitionVote.find_or_initialize_by(user: user, definition: definition)

      if definition_vote.is_a?(DefinitionVoteUp)
        definition_vote.destroy!
      else
        definition_vote.update!(type: "DefinitionVoteUp")
      end
    end
  end
end
