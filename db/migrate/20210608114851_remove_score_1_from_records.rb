class RemoveScore1FromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :score_1, :integer
    remove_column :records, :enemyscore, :integer
  end
end
