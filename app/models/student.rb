class Student < ActiveRecord::Base

	#relationships
	belongs_to :household
	belongs_to :school
	has_many :roster_spots
	has_many :registrations
	has_many :teams, :through => :rosterspots
	has_many :guardians, :through => :household



end
