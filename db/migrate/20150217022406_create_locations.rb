class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.boolean :active

      t.timestamps
    end
  end
end
