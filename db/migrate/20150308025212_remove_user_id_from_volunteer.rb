class RemoveUserIdFromVolunteer < ActiveRecord::Migration
  def change
  	  	remove_column :volunteers, :user_id
  end
end
