# frozen_string_literal: true

# == Schema Information
#
# Table name: unknown_words
#
#  id         :bigint           not null, primary key
#  word       :string
#  memo       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :unknown_word do
    word { Faker::Science.element_symbol }
    memo { Faker::Lorem.sentence }
  end
end
