class RemoveScoreFromDefinitions < ActiveRecord::Migration[6.0]
  def change
    remove_column :definitions, :score, :integer
  end
end
