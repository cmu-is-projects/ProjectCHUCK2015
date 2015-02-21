class Guardian < ActiveRecord::Base

	#relationships
	belongs_to :household
    has_one :user
    has_many :students, through: :households

end
