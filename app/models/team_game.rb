class TeamGame < ActiveRecord::Base
  
  #relationships
  belongs_to :team
  belongs_to :game
  has_many :coaches, through: :team
  has_many :roster_spots, through: :team
  
end
