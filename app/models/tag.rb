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

class Tag < ApplicationRecord
  strip_attributes

  belongs_to :user, optional: true
  has_many :definition_tags, dependent: :destroy

  validates :name, presence: true
end
