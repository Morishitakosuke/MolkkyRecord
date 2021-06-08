class CreateScoreRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :score_records do |t|
      t.references :record, null: false, foreign_key: true
      t.references :score, null: false, foreign_key: true

      t.timestamps
    end
  end
end
