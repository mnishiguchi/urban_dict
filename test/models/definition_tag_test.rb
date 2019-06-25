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
end
