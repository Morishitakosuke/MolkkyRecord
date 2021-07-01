class AddEnemyteamToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :enemyteam, :string
    add_column :records, :enemyname, :string
  end
end
