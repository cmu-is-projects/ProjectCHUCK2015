class RemoveNumStudentsTeam < ActiveRecord::Migration
  def change
  	remove_column :teams, :num_students
  end
end
