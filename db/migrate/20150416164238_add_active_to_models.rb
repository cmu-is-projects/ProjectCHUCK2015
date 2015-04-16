class AddActiveToModels < ActiveRecord::Migration
  def change
  	add_column :brackets, :active, :boolean
  	add_column :tournaments, :active, :boolean
  	add_column :registrations, :active, :boolean
  end
end
