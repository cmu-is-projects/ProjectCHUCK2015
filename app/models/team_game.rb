class TeamGame < ActiveRecord::Base
  
  #Relationships
  belongs_to :team
  belongs_to :game

  #Validations
  validates_numericality_of :score

  #Custom validations
  validate :valid_team_and_game_id

  #team_id exists in system
  #game_id exists in the system
  def valid_team_and_game_id
    all_teams = Team.all.to_a.map{|u| u.id}
    all_games = Game.all.to_a.map{|u| u.id}
    return all_teams.include?(self.team.id) && all_games.include?(self.game.id)
  end


  
end
