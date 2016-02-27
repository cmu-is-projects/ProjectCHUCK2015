class Team < ActiveRecord::Base

    before_save :check_wins_losses, on: [:update, :create]

	#relationships
	has_many :roster_spots
    has_many :volunteers
    belongs_to :bracket
    has_many :team_games
    has_many :students, through: :roster_spots
    has_many :games, through: :team_games
    
    #validations
    validates :name, presence: true, uniqueness: true

    validates_numericality_of :num_wins, :num_losses, allow_blank: true
    validates_numericality_of :max_students
    validate :valid_bracket_id
    validate :has_available_spots?


  def check_wins_losses
    if self.num_wins.nil?
        self.num_wins = 0
    end
    if self.num_losses.nil?
        self.num_losses = 0
    end
  end

    #custom validation: bracket_id exists in the system
    def valid_bracket_id
        all_brackets = Bracket.all.to_a.map{|u| u.id}
        return all_brackets.include?(self.bracket.id) 
    end

    #scopes
    scope :alphabetical, -> { order('name') }
    scope :wins, -> { order ('num_wins desc') }
    scope :losses, -> { order('num_losses desc') }
    scope :by_bracket, -> { order('bracket_id')}


    #custom functions 
    def has_available_spots?
        if (self.roster_spots.length > self.max_students)
          errors.add(:team, "has no spots left.")
        end
    	
    end

    #NOTE: one more function to be added later
    #update record (num wins and losses) based 
    #on updated scores (completed team_game records)

end
