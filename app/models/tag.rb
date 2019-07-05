# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  strip_attributes

  has_many :definition_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 20 }

  alias_attribute :author, :user

  class << self
    def update_with_definition(definition)
      definition.tag_names.to_s.split(",").compact.uniq.map do |tag_name|
        Tag.find_or_create_by(name: tag_name)
      end
    end
  end
end
