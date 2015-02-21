class TeamGame < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :team
  belongs_to :game
  
end
