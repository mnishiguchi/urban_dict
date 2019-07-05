# frozen_string_literal: true

class AddTagNamesToDefinitions < ActiveRecord::Migration[6.0]
  def change
    add_column :definitions, :tag_names, :string
  end
end
