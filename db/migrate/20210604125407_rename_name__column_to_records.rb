class RenameNameColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :name, :name_a
    rename_column :records, :enemyname, :enemyname_a
    rename_column :records, :score, :score_1
  end
end
