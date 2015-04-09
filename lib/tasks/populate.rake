namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do

#comment this stuff out to get populate to work locally:
    #Rake::Task['db:drop'].invoke
    #Rake::Task['db:create'].invoke
    # Invoke rake db:migrate
    #Rake::Task['db:migrate'].invoke
    #Rake::Task['db:test:prepare'].invoke
    # Need gem to make this work when adding students later: faker
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'


    #required default information
    #TEAMS NBA/WNBA

    #Tournament(s)

    #brackets


    # Step 1: Create some schools
    perry = School.new
    perry.name = "Perry High School"
    perry.district = "Pittsburgh Public Schools"
    perry.county = "Allegheny"
    perry.save!

    scitech = School.new
    scitech.name = "Science Tech Academy"
    scitech.district = "Pittsburgh Public Schools"
    scitech.county = "Other"
    scitech.save!

    # Step 2: Create some households
    durants = Household.new
    durants.street = "1 Durant Lane"
    durants.city = "Pittsburgh"
    durants.state = "PA"
    durants.zip = "15289"
    durants.home_phone = "4120000000"
    durants.county = "Allegheny"
    durants.active = true
    durants.save!

    james = Household.new
    james.street = "23 James Lane"
    james.city = "Pittsburgh"
    james.state = "PA"
    james.zip = "15289"
    james.home_phone = "4129999999"
    james.county = "Armstrong"
    james.active = true
    james.save!

    # Step 3: Create some tournaments
    fourteen = Tournament.new
    fourteen.name = "Project Chuck 2014"
    fourteen.description = "This is the tournament for 2014"
    fourteen.start_date = Date.new(2014,5,14)
    fourteen.end_date = Date.new(2014,8,14)
    fourteen.save!

    fifteen = Tournament.new
    fifteen.name = "Project Chuck 2015"
    fifteen.description = "This is the tournament for 2015"
    fifteen.start_date = Date.new(2015,5,14)
    fifteen.save!

    # Step 4: Create some locations
    barclays = Location.new
    barclays.name = "Barclays Center"
    barclays.street = "1 Atlantic Avenue"
    barclays.city = "New York"
    barclays.state = "NY"
    barclays.zip = "11217"
    barclays.active = true
    barclays.save!

    cea = Location.new
    cea.name = "Chesapeake Energy Arena"
    cea.street = "100 W Reno Ave"
    cea.city = "Oklahoma City"
    cea.state = "OK"
    cea.zip = "73102"
    cea.active = true
    cea.save!

    # Step 5: Create some guardians
    daddydurant = Guardian.new
    daddydurant.household_id = durants.id
    daddydurant.email = "daddy.durant@gmail.com"
    daddydurant.first_name = "Daddy"
    daddydurant.last_name = "Durant"
    daddydurant.cell_phone = "4121111111"
    daddydurant.receives_text_msgs = true
    daddydurant.active = true
    daddydurant.save!

    # Step 6: Create some students
    kevindurant = Student.new
    kevindurant.household_id = 1
    kevindurant.school_id = perry.id
    kevindurant.first_name = "Kevin"
    kevindurant.last_name = "Durant"
    kevindurant.dob = 10.years.ago.to_date
    kevindurant.cell_phone = "4122222222"
    kevindurant.email = "kevin.durant@gmail.com"
    kevindurant.grade = 5
    kevindurant.gender = "M"
    kevindurant.emergency_contact_name = "Mommy Durant"
    kevindurant.emergency_contact_phone = "4122184098"
    kevindurant.has_birth_certificate = true
    kevindurant.allergies = "Bees"
    kevindurant.security_question = "What is your nba team"
    kevindurant.security_response = "OKC"
    kevindurant.active = true
    kevindurant.save!

    lebron = Student.new
    lebron.household_id = 2
    lebron.school_id = perry.id
    lebron.first_name = "Lebron"
    lebron.last_name = "James"
    lebron.dob = 8.years.ago.to_date
    lebron.cell_phone = "4122323232"
    lebron.email = "Lebron.james@gmail.com"
    lebron.grade = 3
    lebron.gender = "M"
    lebron.emergency_contact_name = "Mommy James"
    lebron.emergency_contact_phone = "4122184777"
    lebron.has_birth_certificate = true
    lebron.allergies = "Bees"
    lebron.security_question = "What is your nba team"
    lebron.security_response = "cavs"
    lebron.active = true
    lebron.save!

    # Step 7: Create some brackets
    boys1 = Bracket.new
    boys1.gender = "M"
    boys1.tournament_id = fifteen.id
    boys1.min_age = 6
    boys1.max_age = 9
    boys1.max_students = 100
    boys1.save!

    boys2 = Bracket.new
    boys2.gender = "M"
    boys2.tournament_id = fifteen.id
    boys2.min_age = 10
    boys2.max_age = 13
    boys2.max_students = 100
    boys2.save!

    boys3 = Bracket.new
    boys3.gender = "M"
    boys3.tournament_id = fifteen.id
    boys3.min_age = 14
    boys3.max_age = 18
    boys3.max_students = 100
    boys3.save!

    # Step 8: Create some registrations
    kdreg = Registration.new
    kdreg.student_id = kevindurant.id
    kdreg.bracket_id = boys1.id
    kdreg.has_report_card = true
    kdreg.has_proof_of_insurance = true
    kdreg.insurance_provider = "Aetna"
    kdreg.insurance_policy_no = "50550523482094"
    kdreg.family_physician = "Dr. O'Neil"
    kdreg.physician_phone = "1231230983"
    kdreg.has_physical = true
    kdreg.physical_date = 4.months.ago.to_date
    kdreg.jersey_size = "M"
    kdreg.active
    kdreg.save!

    # Step 9: Create some teams
    okc = Team.new
    okc.name = "Thunder"
    okc.max_students = 20
    okc.bracket_id = boys1.id
    okc.save!

    nets = Team.new
    nets.name = "Nets"
    nets.max_students = 20
    nets.bracket_id = boys1.id
    nets.save!

    # Step 10: Create some roster spots
    kdrs = RosterSpot.new
    kdrs.team_id = okc.id
    kdrs.student_id = kevindurant.id
    kdrs.start_date = fifteen.start_date
    kdrs.position = "Forward"
    kdrs.save!

    # Step 11: Create some volunteers
    scottbrooks = Volunteer.new
    scottbrooks.team_id = okc.id
    scottbrooks.role = "coach"
    scottbrooks.email = "scottbrooks@gmail.com"
    scottbrooks.first_name = "Scott"
    scottbrooks.last_name = "Brooks"
    scottbrooks.cell_phone = "2139198232"
    scottbrooks.shirt_size = "L"
    scottbrooks.receives_text_msgs = true
    scottbrooks.active = true
    scottbrooks.save!
    
    alliewilson = Volunteer.new
    alliewilson.team_id = nets.id
    alliewilson.role = "coach"
    alliewilson.email = "aswilson@andrew.cmu.edu"
    alliewilson.first_name = "Allie"
    alliewilson.last_name = "Wilson"
    alliewilson.cell_phone = "4107500575"
    alliewilson.shirt_size = "S"
    alliewilson.receives_text_msgs = false
    alliewilson.active = true
    alliewilson.save!

    # Step 12: Create some users
    admintest = User.new
    admintest.username = "admintest"
    admintest.role = "admin"
    admintest.email = "aswilson@andrew.cmu.edu"
    admintest.active = true
    admintest.password = "charliesangels"
    admintest.password_confirmation = "charliesangels"
    admintest.volunteer_id = alliewilson.id
    admintest.save!
    

    # Step 13: Create some games
    game1 = Game.new
    game1.location_id = cea.id
    game1.date = Date.new(2015,6,14)
    game1.save!
    
    # Step 14: Create some teams games
    okcgame1 = TeamGame.new
    okcgame1.game_id = game1.id
    okcgame1.team_id = okc.id
    okcgame1.score = "100"
    okcgame1.save!

    netsgame1 = TeamGame.new
    netsgame1.game_id = game1.id
    netsgame1.team_id = nets.id
    netsgame1.score = "101"
    netsgame1.save!
    end
end