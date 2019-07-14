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
  validate -> { errors.add(:word, "has already been explained") if Definition.words.include?(word.to_s.titleize) }

  before_save :standardize_on_word_format

  class << self
    def delete_already_explained
      where(word: Definition.words).delete_all
    end
  end

  private

  def standardize_on_word_format
    self.word = word.titleize
  end
end
