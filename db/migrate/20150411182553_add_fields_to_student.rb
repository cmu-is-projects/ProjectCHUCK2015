class AddFieldsToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :birth_certificate, :string
  	add_column :students, :emergency_contact_relation, :string
  end
end
