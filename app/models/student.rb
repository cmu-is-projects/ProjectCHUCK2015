class Student < ActiveRecord::Base

	#relationships
	belongs_to :household
	belongs_to :school
	has_many :rosterSpots
	has_many :registrations
	has_many :teams, :through => :rosterSpots
	has_many :guardians, :through => :household



end
