class AddScore1ToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :score_1, :integer
    add_column :records, :score_2, :integer
    add_column :records, :score_3, :integer
    add_column :records, :score_4, :integer
    add_column :records, :score_5, :integer
    add_column :records, :score_6, :integer
    add_column :records, :score_7, :integer
    add_column :records, :score_8, :integer
    add_column :records, :score_9, :integer
    add_column :records, :score_10, :integer
    add_column :records, :enemyscore_1, :integer
    add_column :records, :enemyscore_2, :integer
    add_column :records, :enemyscore_3, :integer
    add_column :records, :enemyscore_4, :integer
    add_column :records, :enemyscore_5, :integer
    add_column :records, :enemyscore_6, :integer
    add_column :records, :enemyscore_7, :integer
    add_column :records, :enemyscore_8, :integer
    add_column :records, :enemyscore_9, :integer
    add_column :records, :enemyscore_10, :integer
  end
end
