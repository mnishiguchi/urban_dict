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

class Definition < ApplicationRecord
  strip_attributes

  belongs_to :user, optional: true
  belongs_to :word, touch: true
  has_many :definition_vote_ups, dependent: :destroy
  has_many :definition_vote_downs, dependent: :destroy
  has_many :definition_tags, dependent: :destroy

  validates :definition, presence: true
end
