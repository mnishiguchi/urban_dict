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
        DefinitionTag.where(definition: definition).delete_all
        Tag.update_with_definition(definition).each do |tag|
          t = definition.definition_tags.create(tag: tag)
          raise ActiveRecord::Rollback unless t.persisted?
        end
      end
      true
    end
  end
end
