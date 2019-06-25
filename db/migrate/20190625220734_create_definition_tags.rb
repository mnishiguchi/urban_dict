# frozen_string_literal: true

class CreateDefinitionTags < ActiveRecord::Migration[6.0]
  def change
    create_table :definition_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :definition, null: false, foreign_key: true

      t.timestamps
    end

    add_index :definition_tags, [:tag_id, :definition_id], unique: true
  end
end
