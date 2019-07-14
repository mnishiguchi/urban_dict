# frozen_string_literal: true

require "test_helper"

class Definition::SearchTest < ActiveSupport::TestCase
  def setup
    # Some random definitions
    create_list(:definition, 3)
  end

  test "with no options" do
    result = Definition::Search.call

    assert result.blank?
  end

  test "with q provided" do
    create(:definition, word: "Hello")

    result = Definition::Search.call(q: "Hello")

    assert_equal "Hello", result.first.word
  end

  test "with tag provided" do
    # Create a definition with the Tech tag.
    DefinitionTag.update_with_definition(
      create(:definition, word: "Hello", tag_names: "Tech")
    )

    result = Definition::Search.call(tag: "Tech")

    assert_equal "Tech", result.first.tag_names
  end
end
