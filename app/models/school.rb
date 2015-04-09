class School < ActiveRecord::Base
  
  #Relationship Validations
  has_many :students
  
  #validations
  validates_presence_of :name
  # district_array = [["Other",0],["Allegheny Valley School District",1],["Avonworth School District",2],
                          # ["Baldwin-Whitehall School District",3],["Bethel Park School District",4],
                          # ["Brentwood Borough School District",5],["Carlynton School District",6],
                          # ["Chartiers Valley School District",7],["Clairton City School District",8],
                          # ["Cornell School District",9],["Deer Lakes School District",10],
                          # ["Duquesne City School District",11],["East Allegheny School District",12],
                          # ["Elizabeth Forward School District",13],["Fox Chapel Area School District",14],
                          # ["Gateway School District",15],["Hampton Township School District",16],
                          # ["Highlands School District",17],["Keystone Oaks School District",18],
                          # ["McKeesport Area School District",19],["Montour School District",20],
                          # ["Moon Area School District",21],["Mt. Lebanon School District",22],
                          # ["North Allegheny School District",23],["North Hills School District",24],
                          # ["Northgate School District",25],["Penn Hills School District",26],
                          # ["Pine-Richland School District",27],["Plum Borough School District",28],
                          # ["Quaker Valley School District",29],["Riverview School District",30],
                          # ["Shaler Area School District",31],["South Allegheny School District",32],
                          # ["South Fayette Township School District",33], ["Steel Valley School District",34],
                          # ["Sto-Rox School District",35],["Upper St. Clair School District",36],
                          # ["West Allegheny School District",37],["West Jefferson Hills School District",38],
                          # ["West Mifflin Area School District",39],["Wilkinsburg School District",40],
                          # ["Woodland Hills School District",41]]
  district_array = ["Pittsburgh Public Schools","Other"]
  county_array = ["Allegheny","Other"]
  validates :district, inclusion: { in: district_array, allow_blank: false }
  validates :county, inclusion: { in: county_array, allow_blank: false }
  
  #scopes
  scope :alphabetical, -> { order('name') }
  
end
