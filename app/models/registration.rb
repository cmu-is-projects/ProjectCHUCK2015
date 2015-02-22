class Registration < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :bracket
  belongs_to :student
  
end
