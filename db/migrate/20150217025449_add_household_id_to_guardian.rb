class AddHouseholdIdToGuardian < ActiveRecord::Migration
  def change
    add_column :guardians, :household_id, :integer
  end
end
