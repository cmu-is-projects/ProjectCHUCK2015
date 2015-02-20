class Bracket < ActiveRecord::Base

  #relationships
  has_many :teams
  belongs_to :tournament
  has_many :registrations

end
