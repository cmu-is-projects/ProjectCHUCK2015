class School < ActiveRecord::Base
  
  #Relationship Validations
  # has_many :students
  
  #validations
  validates_presence_of :name
  DISTRICT_ARRAY = ["Steel Valley School District", "Allegheny Valley School District","Avonworth School District",
                          "Baldwin-Whitehall School District","Bethel Park School District",
                          "Brentwood Borough School District","Carlynton School District",
                          "Chartiers Valley School District","Clairton City School District",
                          "Cornell School District","Deer Lakes School District",
                          "Duquesne City School District","East Allegheny School District",
                          "Elizabeth Forward School District","Fox Chapel Area School District",
                          "Gateway School District", "Hampton Township School District",
                          "Highlands School District","Keystone Oaks School District",
                          "McKeesport Area School District","Montour School District",
                          "Moon Area School District","Mt. Lebanon School District",
                          "North Allegheny School District","North Hills School District",
                          "Northgate School District","Penn Hills School District",
                          "Pine-Richland School District","Pittsburgh Public School District",
                          "Plum Borough School District","Quaker Valley School District",
                          "Riverview School District",
                          "Shaler Area School District","South Allegheny School District",
                          "South Fayette Township School District", 
                          "Sto-Rox School District","Upper St. Clair School District",
                          "West Allegheny School District","West Jefferson Hills School District",
                          "West Mifflin Area School District","Wilkinsburg School District",
                          "Woodland Hills School District", "Other (Not Listed)"]
  county_array = ["Allegheny","Other"]
  # validates :district, inclusion: { in: district_array, allow_blank: false }
  validates :county, inclusion: { in: county_array, allow_blank: false }
  
  #scopes
  scope :alphabetical, -> { order('name') }
  
end
