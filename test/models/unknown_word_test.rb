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

require "test_helper"

class UnknownWordTest < ActiveSupport::TestCase
  should validate_presence_of(:word)

  test "delete_already_explained" do
    create(:unknown_word, word: "Hello")
    create(:definition, word: "Hello", definition: "Greeting in English")

    assert_changes "UnknownWord.count", from: 1, to: 0 do
      UnknownWord.delete_already_explained
    end
  end
end
