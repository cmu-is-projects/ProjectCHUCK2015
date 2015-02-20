class User < ActiveRecord::Base
  
  #relationships
  has_many :coaches
  has_one :guardian
  
end
