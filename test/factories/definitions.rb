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

FactoryBot.define do
  factory :definition do
    definition { Faker::Lorem.sentence }
    example { Faker::Lorem.sentence }
    user
    word { Word.first || create(:word) }
  end
end
