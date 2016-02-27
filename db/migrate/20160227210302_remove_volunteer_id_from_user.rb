class RemoveVolunteerIdFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :volunteer_id
  end
end
