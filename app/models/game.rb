class Game < ActiveRecord::Base
  
  #Relationship Validations
  belongs_to :location
  has_many :team_games
  has_many :teams, through: :team_games
  
  #Validations
  validate :location_is_active_in_system
  validate :date_after_tourney_start

  #Scopes
  scope :chronological, -> { order('date') }



private

  def date_after_tourney_start
    tstart = self.teams.to_a[1].bracket.tournament.start_date
    return date >= tstart
  end


  def location_is_active_in_system
    all_active_locations = Location.active.to_a.map{|u| u.id}
    unless all_active_locations.include?(self.location_id)
      errors.add(:location_id, "is not an active location in the system")
    end
  end
  
end
