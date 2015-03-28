class ChangePhysicalDateToDate < ActiveRecord::Migration
  def change
  	  	remove_column :registrations, :physical_date
  	  	add_column :registrations, :physical_date, :date
  end
end
