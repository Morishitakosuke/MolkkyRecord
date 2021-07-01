class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :name
      t.string :teamname
      t.integer :score
      t.string :place
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
