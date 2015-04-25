class EditActiveAndAddFieldsToRosterSpot < ActiveRecord::Migration
  def change
  	remove_column :roster_spots, :start_date
  	remove_column :roster_spots, :end_date
  	remove_column :roster_spots, :position

  	add_column :roster_spots, :jersey_number, :integer
  	add_column :roster_spots, :active , :boolean

  end
end
