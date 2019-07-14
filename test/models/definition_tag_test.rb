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

    # Tag records are created.
    ruby_tag = Tag.find_by(name: "Ruby")
    tuesday_tag = Tag.find_by(name: "Tuesday")
    assert_not_nil ruby_tag
    assert_not_nil tuesday_tag
    # Joint records are created for definiton and tags.
    assert_not_nil DefinitionTag.find_by(definition: definition, tag: ruby_tag)
    assert_not_nil DefinitionTag.find_by(definition: definition, tag: tuesday_tag)
  end
end
