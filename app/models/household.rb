class Household < ActiveRecord::Base

	#Relationship Validations
	has_many :guardians
	has_many :students

end
