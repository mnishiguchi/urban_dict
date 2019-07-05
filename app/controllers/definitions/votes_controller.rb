# frozen_string_literal: true

module Definitions
  class VotesController < ::ApplicationController
    # POST   /definitions/:definition_id/votes
    def create
      @definition = authorize Definition.find(params[:definition_id])
      Definitions::UpdateVotes.call(definition: @definition, type: params[:type], user: current_user)
      # This is for reading refreshed counter cache.
      @definition.reload
    end
  end
end
