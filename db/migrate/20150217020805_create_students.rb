class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :household_id
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :cell_phone
      t.string :email
      t.integer :grade
      t.string :gender
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :has_birth_certificate
      t.text :allergies
      t.text :medications
      t.text :security_question
      t.text :security_response
      t.boolean :active

      t.timestamps
    end
  end
end
