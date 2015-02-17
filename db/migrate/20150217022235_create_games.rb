class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :team1_score
      t.integer :team2_score
      t.date :date

      t.timestamps
    end
  end
end
