class AddFormFieldsToVolunteer < ActiveRecord::Migration
  def change
  	add_column :volunteers, :date, :date
  	add_column :volunteers, :street, :string
  	add_column :volunteers, :city, :string
  	add_column :volunteers, :state, :string
  	add_column :volunteers, :zip, :string
  	add_column :volunteers, :day_phone, :string
  	add_column :volunteers, :years_with_proj_chuck, :integer
  	add_column :volunteers, :position, :string
  	add_column :volunteers, :team_coached, :string
  	add_column :volunteers, :child_name, :string
  	add_column :volunteers, :shirt_size, :string
  	add_column :volunteers, :has_school_clearance, :boolean
  	add_column :volunteers, :clearance_copy, :string
  	add_column :volunteers, :not_available, :text
  	add_column :volunteers, :two_skills, :text
  	add_column :volunteers, :suggestions, :text
  	add_column :volunteers, :volunteer_sign, :string
  	add_column :volunteers, :volunteer_sign_date, :date

  end
end
