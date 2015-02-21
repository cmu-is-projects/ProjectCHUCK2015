class Student < ActiveRecord::Base

	#Relationship Validations
	belongs_to :household
	belongs_to :school
	has_many :roster_spots
	has_many :registrations
    has_many :guardians, through: :households

end
