class RemoveScoreFromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :score, :integer
    remove_column :records, :enemyscore, :integer
  end
end
