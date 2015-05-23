class EditDateTypeInGame < ActiveRecord::Migration
  def change
  	change_column :games, :date,  :datetime
  end
end
