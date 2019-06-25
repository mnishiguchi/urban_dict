# frozen_string_literal: true

class CreateDefinitionVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :definition_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :definition, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end

    add_index :definition_votes, [:user_id, :definition_id], unique: true
  end
end
