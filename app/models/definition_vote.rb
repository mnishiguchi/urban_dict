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

class DefinitionVote < ApplicationRecord
  belongs_to :user
  belongs_to :definition

  counter_culture :definition, column_name: proc { |model|
    "#{model.type.underscore.pluralize}_count"
  }
  counter_culture :definition, column_name: :score, delta_magnitude: proc { |model|
    model.type == "DefinitionVoteUp" ? 1 : -1
  }

  validates :definition_id, uniqueness: { scope: :user_id }
end
