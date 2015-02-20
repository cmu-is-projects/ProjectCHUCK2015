class Location < ActiveRecord::Base
  
  #relationships
  has_many :games
  
end
