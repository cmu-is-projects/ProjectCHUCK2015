class Game < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :location
  has_many :team_games
  has_many :teams, through: :team_games
  
end
