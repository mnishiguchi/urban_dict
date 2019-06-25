# frozen_string_literal: true

# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

class WordTest < ActiveSupport::TestCase
  should belong_to(:user).class_name("User")
  should have_many(:definitions).class_name("Definition")
end
