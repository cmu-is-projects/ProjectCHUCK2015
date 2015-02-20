class User < ActiveRecord::Base
  
  #Relationship Validations
  has_many :coaches
  has_one :guardian
  
end
