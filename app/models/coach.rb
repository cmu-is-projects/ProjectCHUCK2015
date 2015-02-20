class Coach < ActiveRecord::Base
	
    #Relationship Validations
	belongs_to :user
	belongs_to :team
	
end
