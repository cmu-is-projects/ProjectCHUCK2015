class RenameCoachtoVolunteer < ActiveRecord::Migration
  def change
  	rename_table :coaches, :volunteers
  end
end
