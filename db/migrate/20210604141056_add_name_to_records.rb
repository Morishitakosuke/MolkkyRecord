class AddNameToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :name_b, :string
    add_column :records, :name_c, :string
    add_column :records, :enemyname_b, :string
    add_column :records, :enemyname_c, :string
    add_column :records, :enemyscore, :integer
  end
end
