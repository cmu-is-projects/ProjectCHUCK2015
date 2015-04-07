class RemoveRelationFromGuardian < ActiveRecord::Migration
  def change
  	remove_column :guardians, :relation
  end
end
