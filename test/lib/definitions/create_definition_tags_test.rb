# frozen_string_literal: true

require "test_helper"

class Definitions::UpdateDefinitionTagsTest < ActiveSupport::TestCase
  def setup
    @valid_definition = create(:definition)
  end

  test "#result when success" do
    cdt_result = Definitions::UpdateDefinitionTags.call(
      tag_names: "ruby,tuesday",
      definition: @valid_definition
    )

    assert cdt_result.is_a?(Array)
    assert_equal @valid_definition.tag_ids, cdt_result
  end

  test "#result with invalid definition" do
    assert_raise RuntimeError do
      Definitions::UpdateDefinitionTags.call(
        tag_names: "ruby,tuesday",
        definition: Definition.new
      )
    end
  end

  test "#result with invalid tags" do
    assert_raise RuntimeError do
      InvalidTagNames = Class.new
      Definitions::UpdateDefinitionTags.call(
        tag_names: InvalidTagNames.new,
        definition: @valid_definition
      )
    end
  end
end
