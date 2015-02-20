class RemoveAttributesFromGame < ActiveRecord::Migration
  def change
  	remove_column :games, :team1_score
  	remove_column :games, :team2_score
  end
end
