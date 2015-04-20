class SchoolFieldsInStudents < ActiveRecord::Migration
  def change
  	  	add_column :students, :school, :string
  	  	add_column :students, :district, :string

  end
end
