class AddGuardianIdToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :guardian_id, :integer
  end
end
