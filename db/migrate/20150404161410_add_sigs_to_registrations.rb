class AddSigsToRegistrations < ActiveRecord::Migration
  def change
  	add_column :registrations, :parent_consent_sign, :string
  	add_column :registrations, :parent_consent_date, :date
  	add_column :registrations, :parent_promise_sign, :string
  	add_column :registrations, :parent_promise_date, :date
  	add_column :registrations, :child_promise_sign, :string
  	add_column :registrations, :child_promise_date, :date
  	add_column :registrations, :parent_release_sign, :string
  	add_column :registrations, :parent_release_date, :date
  end
end
