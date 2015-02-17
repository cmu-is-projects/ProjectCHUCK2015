class CreateRosterSpots < ActiveRecord::Migration
  def change
    create_table :roster_spots do |t|
      t.integer :team_id
      t.integer :student_id
      t.date :start_date
      t.date :end_date
      t.string :position

      t.timestamps
    end
  end
end
