# frozen_string_literal: true

class AddIndexToDefinitionsForWord < ActiveRecord::Migration[6.0]
  def change
    add_index :definitions, :word
  end
end
