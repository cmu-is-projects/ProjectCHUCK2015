class RosterSpot < ActiveRecord::Base

	#Relationship Validations
	belongs_to :student
	belongs_to :team

end
