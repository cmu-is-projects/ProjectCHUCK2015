class Guardian < ActiveRecord::Base

	#Relationship Validations
	belongs_to :household
    belongs_to :user
    has_many :students, through: :households

end
