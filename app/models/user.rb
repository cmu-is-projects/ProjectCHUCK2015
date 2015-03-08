class User < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :volunteer
  
end
