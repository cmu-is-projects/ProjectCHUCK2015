class Game < ActiveRecord::Base

  #Relationship Validations
  belongs_to :location
  has_many :team_games
  has_many :teams, through: :team_games

  accepts_nested_attributes_for :team_games, reject_if: lambda { |team_game| team_game[:team_id].blank? }, allow_destroy: true
  
  #Validations
  validate :location_is_active_in_system
  # validate :date_after_tourney_start 

  #Scopes
  scope :chronological, -> { order('date') }

private

  #NEED TO DO JOINS FOR THIS CUZ IT AINT WORKING
  # def date_after_tourney_start
  #   tstart = self.teams.to_a[1].bracket.tournament.start_date
  #   return date >= tstart
  # end


  def location_is_active_in_system
    all_active_locations = Location.active.to_a.map{|u| u.id}
    unless all_active_locations.include?(self.location_id)
      errors.add(:location_id, "is not an active location in the system")
    end
  end
  
end
