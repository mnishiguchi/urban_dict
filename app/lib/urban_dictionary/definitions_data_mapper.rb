# frozen_string_literal: true

module UrbanDictionary
  class DefinitionsDataMapper
    def self.call(definitions_data)
      raise unless definitions_data.is_a?(Enumerable)

      definitions_data.map { |d| DefinitionModel.new(d) }
    end

    class DefinitionModel < ::Hashie::Trash
      include Hashie::Extensions::IndifferentAccess
      include Hashie::Extensions::IgnoreUndeclared

      property :word, required: true
      property :definition, required: true
      property :example, required: true
      property :created_at, from: "written_on", required: true
      property :updated_at, from: "written_on", required: true
    end
  end
end
