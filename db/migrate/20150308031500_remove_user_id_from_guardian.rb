class RemoveUserIdFromGuardian < ActiveRecord::Migration
  def change
  	  	remove_column :guardians, :user_id
  end
end
