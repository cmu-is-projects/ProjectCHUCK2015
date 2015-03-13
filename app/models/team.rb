class Team < ActiveRecord::Base

	#relationships
	has_many :roster_spots
    has_many :volunteers
    belongs_to :bracket
    has_many :team_games
    has_many :students, through: :roster_spots
    has_many :games, through: :team_games
    
    #validations
    validates :name, presence: true, uniqueness: true

    validates_numericality_of :num_wins, :num_losses, :max_students

    #custom validation: bracket_id exists in the system
    #similar to a validation written in bracket. If that one works, the same
    #format will be used here.


end
