# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class TagTest < ActiveSupport::TestCase
  should belong_to(:user).class_name("User")
  should have_many(:definition_tags).class_name("DefinitionTag")

  should validate_presence_of(:name)
end
