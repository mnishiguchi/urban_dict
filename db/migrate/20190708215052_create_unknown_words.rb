# frozen_string_literal: true

class CreateUnknownWords < ActiveRecord::Migration[6.0]
  def change
    create_table :unknown_words do |t|
      t.string :word
      t.text :memo

      t.timestamps
    end
  end
end
