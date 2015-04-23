class AddDateAndCertificationsToVolunteer < ActiveRecord::Migration
  def change
  	remove_column :volunteers, :has_school_clearance

  	add_column :volunteers, :act33_clearance, :boolean
  	add_column :volunteers, :act34_clearance, :boolean
  	add_column :volunteers, :act153_clearance, :boolean
  	add_column :volunteers, :dob, :date

  end
end
