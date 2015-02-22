class Guardian < ActiveRecord::Base

	#relationships
	belongs_to :household
    belongs_to :user

end
