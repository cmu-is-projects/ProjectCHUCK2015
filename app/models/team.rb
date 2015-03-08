class Team < ActiveRecord::Base

	#relationships
	has_many :roster_spots
    has_many :volunteers
    belongs_to :bracket
    has_many :team_games
    has_many :students, through: :roster_spots
    has_many :games, through: :team_games
    
end
