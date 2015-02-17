class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :relation
      t.integer :user_id

      t.timestamps
    end
  end
end
