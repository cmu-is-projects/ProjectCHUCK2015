class RemoveHouseholdIdFromGuardian < ActiveRecord::Migration
  def change
    remove_column :guardians, :household_id
  end
end
