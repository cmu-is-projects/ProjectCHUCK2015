class School < ActiveRecord::Base
  
  #Relationship Validations
  has_many :students
  
end
