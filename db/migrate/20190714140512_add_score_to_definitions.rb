# frozen_string_literal: true

class AddScoreToDefinitions < ActiveRecord::Migration[6.0]
  def change
    add_column :definitions, :score, :integer, null: false, default: 0
    add_index :definitions, :score
  end
end
