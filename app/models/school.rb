class School < ActiveRecord::Base
  
  #relationships
  has_many :students
  
end
