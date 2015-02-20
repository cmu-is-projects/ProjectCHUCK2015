class Tournament < ActiveRecord::Base
  
  #Relationship Validations
  has_many :brackets
  
end
