class Game < ActiveRecord::Base
  
  #relationships
  belongs_to :location
  has_many :team_games
  
end
