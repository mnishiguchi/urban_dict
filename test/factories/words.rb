# frozen_string_literal: true

# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :word do
    name { Faker::Science.element_symbol }
    user
  end
end
