class AddAttributesToModels < ActiveRecord::Migration
  def change
  	add_column :brackets, :max_students, :integer
  	add_column :tournaments, :name, :string
  	add_column :tournaments, :description, :text
  	add_column :team_games, :score, :integer
  	add_column :games, :location_id, :integer
  	add_column :locations, :name, :string
  end
end
