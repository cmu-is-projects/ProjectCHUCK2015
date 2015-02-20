class Tournament < ActiveRecord::Base
  
  #relationships
  has_many :brackets
  
end
