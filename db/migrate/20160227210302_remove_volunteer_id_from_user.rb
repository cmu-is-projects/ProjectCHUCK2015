class RemoveVolunteerIdFromUser < ActiveRecord::Migration
  def change
  	remove_column :user, :volunteer_id
  end
end
