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
    record.errors.add(:word, "has already been explained") if Definition.words.include?(record.word.titleize)
  }

  class << self
    def delete_already_explained
      select(:id, :word).each do |record|
        record.destroy if Definition.words.include?(record.word.titleize)
      end
    end
  end
end
