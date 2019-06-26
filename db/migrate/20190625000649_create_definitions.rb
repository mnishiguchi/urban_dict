# frozen_string_literal: true

class CreateDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :definitions do |t|
      t.string :word, null: false
      t.text :definition, null: false
      t.text :example
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end

    add_index :definitions, :updated_at
  end
end
