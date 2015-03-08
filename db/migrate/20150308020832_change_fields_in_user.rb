class ChangeFieldsInUser < ActiveRecord::Migration
  def change
  	  	remove_column :users, :first_name
  	  	remove_column :users, :last_name
  	  	remove_column :users, :cell_phone
  	  	remove_column :users, :receives_text_msgs
  	  	add_column :users, :coach_id, :integer
  end
end
