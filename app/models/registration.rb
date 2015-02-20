class Registration < ActiveRecord::Base
  
  #relationships
  belongs_to :bracket
  belongs_to :student
  has_many :teams, through: :brackets
  
end
