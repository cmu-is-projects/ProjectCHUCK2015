class AddUserIdToGuardian < ActiveRecord::Migration
  def change
    add_column :guardians, :user_id, :integer
  end
end
