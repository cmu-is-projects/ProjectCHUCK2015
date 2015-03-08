class AddFieldsToVolunteer < ActiveRecord::Migration
  def change
  	  	add_column :volunteers, :email, :string
  	  	add_column :volunteers, :first_name, :string
  	  	add_column :volunteers, :last_name, :string
  	  	add_column :volunteers, :cell_phone, :string
  	  	add_column :volunteers, :receives_text_msgs, :boolean
  	  	add_column :volunteers, :active, :boolean
  	  	add_column :volunteers, :role, :string
  end
end
