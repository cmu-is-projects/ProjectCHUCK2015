class AddUserIdToVolunteer < ActiveRecord::Migration
  def change
  	add_column :volunteer, :user_id
  end
end
