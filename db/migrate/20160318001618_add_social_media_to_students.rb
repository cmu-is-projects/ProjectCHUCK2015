class AddSocialMediaToStudents < ActiveRecord::Migration
  def change
    add_column :students, :twitter, :string
    add_column :students, :facebook, :string
    add_column :students, :instagram, :string
  end
end
