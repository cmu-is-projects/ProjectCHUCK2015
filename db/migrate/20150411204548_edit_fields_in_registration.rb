class EditFieldsInRegistration < ActiveRecord::Migration
  def change
  	remove_column :registrations, :child_promise_sign
  	remove_column :registrations, :child_promise_date

  	add_column :registrations, :child_promise_agree, :boolean
  	add_column :registrations, :child_signature, :string
  	add_column :registrations, :child_sign_date, :date
  end
end
