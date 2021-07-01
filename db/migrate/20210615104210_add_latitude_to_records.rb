class AddLatitudeToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :latitude, :float
    add_column :records, :longitude, :float
  end
end
