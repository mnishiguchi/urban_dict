# frozen_string_literal: true

class AddVoteUpCountVoteDownCountToDefinitions < ActiveRecord::Migration[6.0]
  def change
    change_table :definitions, bulk: true do |t|
      t.integer :definition_vote_ups_count, null: false, default: 0
      t.integer :definition_vote_downs_count, null: false, default: 0
    end
  end
end
