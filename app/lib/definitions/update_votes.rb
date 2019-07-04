# frozen_string_literal: true

module Definitions
  class UpdateVotes < ::ApplicationService
    attr_reader :type, :definition, :user

    def initialize(definition:, type:, user:)
      @type = parse_type(type)
      @definition = parse_definition(definition)
      @user = user
    end

    def call
      vote = DefinitionVote.find_or_initialize_by(user: user, definition: definition)
      if vote.type == type
        vote.destroy!
      else
        vote.update!(type: type)
      end
    end

    private

    def parse_type(value)
      if %w[up down].include?(value)
        "definition_vote_#{value}".classify
      else
        raise "Invalid type: #{value.inspect}"
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
