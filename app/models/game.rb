#NOTE: seems to have a bunch of errors

class Game < ActiveRecord::Base

  # before_save :update_records, on: :update
  before_save :check_score, on: [:update, :create]

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
  #figure out why current is not working
  scope :current, -> { where("date = ?", Date.today) }
  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date > ?", Date.today) }

private

  #NEED TO DO JOINS FOR THIS CUZ IT AINT WORKING
  # def date_after_tourney_start
  #   tstart = self.teams.to_a[1].bracket.tournament.start_date
  #   return date >= tstart
  # end

  def check_score
    self.team_games.to_a.each do |tg|
      if tg.score.nil?
        tg.score = 0
        tg.save!
      end
    end
  end

  # def update_records
  #   tgs = self.team_games.to_a
  #   team1 = Team.all.where(id: tgs[0].team_id)[0]
  #   team2 = Team.all.where(id: tgs[1].team_id)[0]
  #   if ((tgs[0].score == 0) && (tgs[1].score == 1))
  #       team2.num_wins += 1
  #       team1.num_losses += 1
  #   elsif ((tgs[1].score == 0) && (tgs[0].score == 1))
  #       team2.num_losses += 1
  #       team1.num_wins += 1
  #   elsif !((tgs[0].score == 0) && (tgs[1].score == 0))
  #     if (tgs[0].score > tgs[1].score)
  #         team2.num_losses += 1
  #         team1.num_wins += 1
  #     else
  #         team2.num_wins += 1
  #         team1.num_losses += 1
  #     end
  #   end
  # end

  def location_is_active_in_system
    all_active_locations = Location.active.to_a.map{|u| u.id}
    unless all_active_locations.include?(self.location_id)
      errors.add(:location_id, "is not an active location in the system")
    end
  end
  
end

