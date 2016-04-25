class TeamGame < ActiveRecord::Base
  
  #Relationships
  belongs_to :team
  belongs_to :game

  #Validations
  validates_numericality_of :score, allow_blank: true

  #Custom validations
  validate :valid_team_and_game_id

  scope :chronological, -> { joins(:game).order('games.date') }

  #team_id exists in system
  #game_id exists in the system
  def valid_team_and_game_id
    all_teams = Team.all.to_a.map{|u| u.id}
    all_games = Game.all.to_a.map{|u| u.id}
    return all_teams.include?(self.team_id) && all_games.include?(self.game_id)
  end


  
end
