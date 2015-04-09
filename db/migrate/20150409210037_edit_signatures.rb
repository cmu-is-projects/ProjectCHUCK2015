class EditSignatures < ActiveRecord::Migration
  def change
  	remove_column :registrations, :parent_consent_sign
  	remove_column :registrations, :parent_consent_date
  	remove_column :registrations, :parent_promise_sign
  	remove_column :registrations, :parent_promise_date
  	remove_column :registrations, :parent_release_sign
  	remove_column :registrations, :parent_release_date

  	add_column :registrations, :parent_consent_agree, :boolean
  	add_column :registrations, :parent_promise_agree, :boolean
  	add_column :registrations, :parent_release_agree, :boolean
  	add_column :registrations, :parent_signature, :string
  	add_column :registrations, :parent_sign_date, :date


  end
end
