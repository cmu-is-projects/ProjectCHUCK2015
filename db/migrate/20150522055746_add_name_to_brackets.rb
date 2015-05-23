class AddNameToBrackets < ActiveRecord::Migration
  def change
  	add_column :brackets, :name, :string
  end
end
