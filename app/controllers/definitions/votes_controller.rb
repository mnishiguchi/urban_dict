# frozen_string_literal: true

module Definitions
  class VotesController < ::ApplicationController
    # POST   /definitions/:definition_id/votes
    def create
      @definition = authorize Definition.find(params[:definition_id])

      if params[:type] == "up"
        DefinitionVoteUp.vote(definition: @definition, user: current_user)
      elsif params[:type] == "down"
        DefinitionVoteDown.vote(definition: @definition, user: current_user)
      else
        raise "Invalid type #{type.inspect}"
      end

      # This is for reading refreshed counter cache.
      @definition.reload
    end
  end
end
