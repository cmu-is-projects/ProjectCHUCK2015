class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :student_id
      t.integer :bracket_id
      t.boolean :has_report_card
      t.boolean :has_proof_of_insurance
      t.string :insurance_provider
      t.string :insurance_policy_no
      t.string :family_physician
      t.string :physician_phone
      t.boolean :has_physical
      t.boolean :physical_date
      t.string :jersey_size
      t.boolean :active

      t.timestamps
    end
  end
end
