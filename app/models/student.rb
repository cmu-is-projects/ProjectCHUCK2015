class Student < ActiveRecord::Base

	#Relationship Validations
	belongs_to :household
	belongs_to :school
	has_many :roster_spots
	has_many :registrations
    has_many :brackets, through: :registrations
    has_many :teams, through: :roster_spots

end
