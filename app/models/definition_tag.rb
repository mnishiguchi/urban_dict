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

class DefinitionTag < ApplicationRecord
  belongs_to :tag
  belongs_to :definition

  class << self
    def update_with_definition(definition)
      ApplicationRecord.transaction do
        definition.save!
        DefinitionTag.where(definition: definition).delete_all
        Tag.from_tag_names(definition.tag_names.to_s.split(",")).each do |tag|
          definition.definition_tags.create!(tag: tag)
        end
      end
      true
    end
  end
end
