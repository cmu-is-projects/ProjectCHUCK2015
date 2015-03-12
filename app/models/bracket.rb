class Bracket < ActiveRecord::Base

  #Relationships 
  has_many :teams
  belongs_to :tournament
  has_many :registrations
  has_many :students, through: :registrations

  #Validations
  validates_presence_of :gender

  validates_numericality_of :max_students
  validates_numericality_of :min_age
  validates_numericality_of :max_age 

  validate :minlessmax
  validate :valid_tournament_id

  # Scopes
  # by gender 
  scope :male, -> { where("gender = ?","M") }
  scope :female, -> { where("gender = ?", "F") }

  #by age group
  #this needs some clarification 

  #is full
  scope :full, -> { where("max_students = ? ", num_registered) }
  scope :not_full, -> { where("max_students > ?", num_registered) }


  #Methods
  def get_teams
  	return self.teams
  end



  private 
  #Custom validations

  def minlessmax
  	return self.min_age < self.max_age 
  end

  #tournament id must exist in the system
  #AND end_date of that tournament is null 
  #i.e. tounament is active
  def valid_tournament_id
  	all_tournaments = Tournament.to_a.map{|u| u.id}
  	return all_tournaments.include?(self.tournament.id) && self.tournament.end_date.nil?
  end

  #HELPER FUNCTIONS
  def num_registered
	return self.registrations.to_a.length
  end 

end
