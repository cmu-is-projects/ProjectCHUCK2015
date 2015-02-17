class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :bracket_id
      t.string :name
      t.integer :num_students
      t.integer :max_students
      t.integer :num_wins
      t.integer :num_losses

      t.timestamps
    end
  end
end
