# frozen_string_literal: true

module Definitions
  class UpdateTags < ::ApplicationService
    attr_reader :tag_names, :definition

    def initialize(tag_names:, definition:)
      @tag_names = parse_tag_names(tag_names)
      @definition = parse_definition(definition)
    end

    def call
      ApplicationRecord.transaction do
        DefinitionTag.where(definition: definition).delete_all

        tag_ids.each do |tag_id|
          t = definition.definition_tags.create(tag_id: tag_id)
          raise ActiveRecord::Rollback unless t.persisted?
        end
      end

      tag_ids
    end

    private

    def tag_ids
      tag_names.map { |tag_name| Tag.find_or_create_by(name: tag_name) }.map(&:id)
    end

    def parse_tag_names(value)
      if value.is_a?(Array)
        value
      elsif value.is_a?(String)
        value.split(",")
      else
        raise "Invalid tag_names: #{value.inspect}"
      end
    end

    def parse_definition(value)
      if value.is_a?(Definition) && value.persisted?
        value
      else
        raise "Invalid definition: #{value.inspect}"
      end
    end
  end
end
