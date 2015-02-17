class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :home_phone
      t.string :county
      t.boolean :active

      t.timestamps
    end
  end
end
