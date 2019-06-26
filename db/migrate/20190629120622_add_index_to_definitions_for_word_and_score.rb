# frozen_string_literal: true

class AddIndexToDefinitionsForWordAndScore < ActiveRecord::Migration[6.0]
  def change
    add_index :definitions, [:word, :score]
  end
end
