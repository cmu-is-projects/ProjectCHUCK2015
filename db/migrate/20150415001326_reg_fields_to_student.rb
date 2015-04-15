class RegFieldsToStudent < ActiveRecord::Migration
  def change
  	remove_column :registrations, :has_report_card
  	remove_column :registrations, :has_proof_of_insurance
  	remove_column :registrations, :insurance_provider
  	remove_column :registrations, :insurance_policy_no
  	remove_column :registrations, :family_physician
  	remove_column :registrations, :physician_phone
  	remove_column :registrations, :has_physical
  	remove_column :registrations, :jersey_size
  	remove_column :registrations, :active
  	remove_column :registrations, :physical_date
  	remove_column :registrations, :report_card
  	remove_column :registrations, :parent_consent_agree
  	remove_column :registrations, :parent_promise_agree
  	remove_column :registrations, :parent_release_agree
  	remove_column :registrations, :parent_signature
  	remove_column :registrations, :parent_sign_date
  	remove_column :registrations, :proof_of_insurance
  	remove_column :registrations, :physical
  	remove_column :registrations, :child_promise_agree
  	remove_column :registrations, :child_signature
  	remove_column :registrations, :child_sign_date

  	add_column :students, :has_report_card, :boolean
  	add_column :students, :has_proof_of_insurance, :boolean
  	add_column :students, :insurance_provider, :string
  	add_column :students, :insurance_policy_no, :string
  	add_column :students, :family_physician, :string
  	add_column :students, :physician_phone, :string
  	add_column :students, :has_physical, :boolean
  	add_column :students, :jersey_size, :string
  	add_column :students, :physical_date, :date
  	add_column :students, :report_card, :string
  	add_column :students, :parent_consent_agree, :boolean
  	add_column :students, :parent_promise_agree, :boolean
  	add_column :students, :parent_release_agree, :boolean
  	add_column :students, :parent_signature, :string
  	add_column :students, :parent_sign_date, :date
  	add_column :students, :proof_of_insurance, :string
  	add_column :students, :physical, :string
  	add_column :students, :child_promise_agree, :boolean
  	add_column :students, :child_signature, :string
  	add_column :students, :child_sign_date, :date

  end
end
