class AddGpaandquestionToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :gpa, :string
  	add_column :students, :pastparticipation, :integer
  end
end
