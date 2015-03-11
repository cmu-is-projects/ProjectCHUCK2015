class School < ActiveRecord::Base
  
  #Relationship Validations
  has_many :students
  
  #validations
  validates_presence_of :name
  district_array = ["North Allegheny School District","Pittsburgh Public Schools","Other"]
  county_array = ["Allegheny","Other"]
  validates :district, inclusion: { in: district_array, allow_blank: false }
  validates :county, inclusion: { in: county_array, allow_blank: false }
  
  #scopes
  scope :alphabetical, -> { order('name') }
  
end
