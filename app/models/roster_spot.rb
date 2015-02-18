class RosterSpot < ActiveRecord::Base

	#relationships
	belongs_to :student
	belongs_to :team

end
