class AddGenderAndAgeRangeToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :gender, :string
    add_column :volunteers, :age_range, :string
  end
end
