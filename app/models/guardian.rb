class Guardian < ActiveRecord::Base

	#relationships
	belongs_to :household
    has_one :user

end
