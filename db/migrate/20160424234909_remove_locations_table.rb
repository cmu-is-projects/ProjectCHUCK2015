class RemoveLocationsTable < ActiveRecord::Migration
  def change
    drop_table :locations
    remove_column :games, :location_id, :integer
  end
end
