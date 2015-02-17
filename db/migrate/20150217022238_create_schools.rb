class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :district
      t.string :county

      t.timestamps
    end
  end
end
