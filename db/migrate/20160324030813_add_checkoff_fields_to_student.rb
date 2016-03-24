class AddCheckoffFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :poi_checkoff, :bool
    add_column :students, :bc_checkoff, :bool
    add_column :students, :rc_checkoff, :bool
    add_column :students, :phy_checkoff, :bool
  end
end
