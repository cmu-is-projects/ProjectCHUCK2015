class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.string :email
      t.boolean :active
      t.string :password_digest
      t.date :active_after
      t.string :password_reset_token
      t.date :password_reset_sent_at
      t.string :first_name
      t.string :last_name
      t.string :cell_phone
      t.boolean :receives_text_msgs

      t.timestamps
    end
  end
end
