class Location < ActiveRecord::Base
  
  #Relationship Validations
  has_many :games
  
end
