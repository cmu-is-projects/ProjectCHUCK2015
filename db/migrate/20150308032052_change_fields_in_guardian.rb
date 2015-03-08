class ChangeFieldsInGuardian < ActiveRecord::Migration
  def change
  	  	add_column :guardians, :email, :string
  	  	add_column :guardians, :first_name, :string
  	  	add_column :guardians, :last_name, :string
  	  	add_column :guardians, :cell_phone, :string
  	  	add_column :guardians, :receives_text_msgs, :boolean
  	  	add_column :guardians, :active, :boolean
  end
end
