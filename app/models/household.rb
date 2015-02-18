class Household < ActiveRecord::Base

	#relationships
	has_many :guardians
	has_many :students

end
