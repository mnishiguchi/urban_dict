# frozen_string_literal: true

# == Schema Information
#
# Table name: definition_tags
#
#  id            :bigint           not null, primary key
#  tag_id        :bigint           not null
#  definition_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "test_helper"

class DefinitionTagTest < ActiveSupport::TestCase
  should belong_to(:tag).class_name("Tag")
  should belong_to(:definition).class_name("Definition")

  def setup
    @valid_definition = create(:definition)
  end

  test "update_with_definition" do
    definition = create(:definition, tag_names: "ruby,tuesday")

    DefinitionTag.update_with_definition(definition)

    assert_not_nil Tag.find_by(name: "ruby")
    assert_not_nil Tag.find_by(name: "tuesday")
    assert_not_nil DefinitionTag.find_by(definition: definition, tag: Tag.find_by(name: "ruby"))
    assert_not_nil DefinitionTag.find_by(definition: definition, tag: Tag.find_by(name: "tuesday"))
  end
end
