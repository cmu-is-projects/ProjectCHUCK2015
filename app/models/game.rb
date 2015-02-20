class Game < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :location
  has_many :team_games
  
end
