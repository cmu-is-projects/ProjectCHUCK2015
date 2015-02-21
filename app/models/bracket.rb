class Bracket < ActiveRecord::Base

  #Relationship Validations
  has_many :teams
  belongs_to :tournament
  has_many :registrations
  has_many :students, through: :registrations

end
