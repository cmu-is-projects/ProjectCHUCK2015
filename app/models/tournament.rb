require "activeable"
class Tournament < ActiveRecord::Base
include Activeable
  
  #Relationship Validations
  has_many :brackets

  #Callbacks
  before_save :tourneyActive, on: [:create, :update]

  #Validations
  validates_presence_of :name, :start_date
  validates_date :start_date
  validates_date :end_date, after: :start_date, allow_blank: true

  #Scopes
  scope :alphabetical, -> { order('name') }
  scope :current, -> { where("start_date <= ? and (end_date > ? or end_date is null)", Date.today, Date.today) }
  scope :past, -> { where("end_date <= ?", Date.today) }
  scope :upcoming, -> { where("start_date > ?", Date.today) }

  #Other Methods
  def is_active?
    return true if end_date.nil?
    (start_date <= Date.today) && (end_date >= Date.today)
  end

  def tourneyActive
    if !(end_date.nil?) && (end_date < Date.today)
      self.active = false
      brackets = Bracket.where('tournament_id = ?', self.id)
      if brackets.nil? == false
        brackets.each do |bracket|
          bracket.active = false
          bracket.save!
        end
      end
    else
      self.active = true
    end
  end

  
end
