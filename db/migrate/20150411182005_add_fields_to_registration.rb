class AddFieldsToRegistration < ActiveRecord::Migration
  def change
  	  add_column :registrations, :proof_of_insurance, :string
  	  add_column :registrations, :physical, :string
  end
end
