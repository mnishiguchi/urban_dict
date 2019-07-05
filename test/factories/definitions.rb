# frozen_string_literal: true

# == Schema Information
#
# Table name: definitions
#
#  id                          :bigint           not null, primary key
#  word                        :string           not null
#  definition                  :text             not null
#  example                     :text
#  user_id                     :bigint
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  definition_vote_ups_count   :integer          default(0), not null
#  definition_vote_downs_count :integer          default(0), not null
#  tag_names                   :string
#

FactoryBot.define do
  factory :definition do
    word { Faker::Science.element_symbol }
    definition { Faker::Lorem.sentence }
    example { Faker::Lorem.sentence }
    tag_names { "" }
    user
  end
end
