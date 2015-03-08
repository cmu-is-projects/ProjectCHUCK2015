class EditCoachIdInUser < ActiveRecord::Migration
  def change
  	  	remove_column :users, :coach_id
  	  	add_column :users, :volunteer_id, :integer
  end
end
