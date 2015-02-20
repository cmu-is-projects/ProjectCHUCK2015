class Guardian < ActiveRecord::Base

	#relationships
	  belongs_to :household
    belongs_to :user
    has_many :students, through: :households

end
