class Registration < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :bracket
  belongs_to :student
  has_many :teams, through: :brackets
  
end
