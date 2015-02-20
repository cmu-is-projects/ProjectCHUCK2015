class Student < ActiveRecord::Base

	#Relationship Validations
	belongs_to :household
	belongs_to :school
	has_many :rosterSpots
	has_many :registrations


end
