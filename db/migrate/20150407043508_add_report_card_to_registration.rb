class AddReportCardToRegistration < ActiveRecord::Migration
  def change
  	add_column :registrations, :report_card, :string
  end
end
