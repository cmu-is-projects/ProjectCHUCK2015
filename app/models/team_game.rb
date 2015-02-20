class TeamGame < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :team
  belongs_to :game
  has_many :coaches, through: :teams
  has_many :roster_spots, through: :teams
  
end
