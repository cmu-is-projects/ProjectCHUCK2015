class Team < ActiveRecord::Base

	#relationships
	 has_many :roster_spots
    has_many :coaches
    belongs_to :bracket
    has_many :team_games
    has_many :registrations, through: :brackets
    
end
