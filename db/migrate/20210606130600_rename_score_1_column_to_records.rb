class RenameScore1ColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :score_1, :score
  end
end
