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

class UnknownWord < ApplicationRecord
  validates :word, presence: true
  validate lambda { |record|
    record.errors.add(:word, "has already been explained") if Definition.defined_words.include?(record.word)
  }
end
