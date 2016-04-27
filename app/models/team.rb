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

  def full?
    self.roster_spots.active.length >= 10
  end

  def taken_jersey_numbers
    nums = []
    self.roster_spots.active.each do |rs|
      nums.push rs.jersey_number
    end
    nums
  end

  def eligible_students
    el_stu = []
    act_stu = Student.active
    assigned_stu = RosterSpot.active.map{ |rs| rs.student_id }
    act_stu.each do |stu|
      reg_flag = false
      stu.registrations.each do |reg|
        if reg.bracket == self.bracket
          reg_flag = true
        end
      end
      if (reg_flag && not(assigned_stu.include? stu.id)) #and check not already assigned
        el_stu.push(stu)
      end
    end
    return el_stu
  end

   def eligible_coaches
    el_stu = []
    act_stu = Student.active
    assigned_stu = RosterSpot.active.map{ |rs| rs.student_id }
    act_stu.each do |stu|
      reg_flag = false
      stu.registrations.each do |reg|
        if reg.bracket == self.bracket
          reg_flag = true
        end
      end
      if (reg_flag && not(assigned_stu.include? stu.id)) #and check not already assigned
        el_stu.push(stu)
      end
    end
    return el_stu
  end

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
  scope :standings, -> { order('num_wins desc, num_losses asc') }
  scope :by_bracket, -> { order('bracket_id')}


  #custom functions
  def has_available_spots?
    if (self.roster_spots.length > self.max_students)
      errors.add(:team, "has no spots left.")
    end
  end

  def self.not_full
    ret = []
    Team.all.each do |team|
      if team.roster_spots.active.length < team.max_students
        ret.push(team)
      end
    end
    ret
  end

  def active_rs
    self.roster_spots.active
  end

  #NOTE: one more function to be added later
  #update record (num wins and losses) based
  #on updated scores (completed team_game records)

end
