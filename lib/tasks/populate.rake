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
    Rake::Task['db:reset'].invoke
    
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

    #Guardian Users
    g1user = User.new
    g1user.username = "guardian1"
    g1user.role = "guardian"
    g1user.email = "guardian1@gmail.com"
    g1user.active = true
    g1user.password = "secret"
    g1user.password_confirmation = "secret"
    g1user.save!

    g2user = User.new
    g2user.username = "guardian2"
    g2user.role = "guardian"
    g2user.email = "guardian2@gmail.com"
    g2user.active = true
    g2user.password = "secret"
    g2user.password_confirmation = "secret"
    g2user.save!

    #GUARDIANS
    g1 = Guardian.new
    g1.user = g1user
    g1.first_name = "Bob"
    g1.last_name = "Jones"
    g1.email = "guardian1@gmail.com"
    g1.cell_phone = rand(10 ** 10).to_s.rjust(10,'0')
    g1.receives_text_msgs = true
    g1.active = true
    g1.save!

    g2 = Guardian.new
    g2.user = g2user
    g2.first_name = "Sue"
    g2.last_name = "Smith"
    g2.email = "guardian2@gmail.com"
    g2.cell_phone = rand(10 ** 10).to_s.rjust(10,'0')
    g2.receives_text_msgs = true
    g2.active = true
    g2.save!

    # Step 2: Create some households
    durants = Household.new
    durants.guardian = g1
    durants.street = "1 Durant Lane"
    durants.city = "Pittsburgh"
    durants.state = "PA"
    durants.zip = "15289"
    durants.home_phone = "4120000000"
    durants.county = "Allegheny"
    durants.active = true
    durants.save!

    james = Household.new
    james.guardian = g2
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
    # barclays = Location.new
    # barclays.name = "Barclays Center"
    # barclays.street = "1 Atlantic Avenue"
    # barclays.city = "New York"
    # barclays.state = "NY"
    # barclays.zip = "11217"
    # barclays.active = true
    # barclays.save!

    # cea = Location.new
    # cea.name = "Chesapeake Energy Arena"
    # cea.street = "100 W Reno Ave"
    # cea.city = "Oklahoma City"
    # cea.state = "OK"
    # cea.zip = "73102"
    # cea.active = true
    # cea.save!

    # Step 5: Create some guardians
    # daddydurant = Guardian.new
    # daddydurant.household_id = durants.id
    # daddydurant.email = "daddy.durant@gmail.com"
    # daddydurant.first_name = "Daddy"
    # daddydurant.last_name = "Durant"
    # daddydurant.cell_phone = "4121111111"
    # daddydurant.receives_text_msgs = true
    # daddydurant.active = true
    # daddydurant.save!

    # Step 6: Create some students
    # kevindurant = Student.new
    # kevindurant.household_id = 1
    # kevindurant.school_id = perry.id
    # kevindurant.first_name = "Kevin"
    # kevindurant.last_name = "Durant"
    # kevindurant.dob = 10.years.ago.to_date
    # kevindurant.cell_phone = "4122222222"
    # kevindurant.email = "kevin.durant@gmail.com"
    # kevindurant.grade = 5
    # kevindurant.gender = "M"
    # kevindurant.emergency_contact_name = "Mommy Durant"
    # kevindurant.emergency_contact_phone = "4122184098"
    # kevindurant.has_birth_certificate = true
    # kevindurant.allergies = "Bees"
    # kevindurant.security_question = "What is your nba team"
    # kevindurant.security_response = "OKC"
    # kevindurant.active = true
    # kevindurant.save!

    # lebron = Student.new
    # lebron.household_id = 2
    # lebron.school_id = perry.id
    # lebron.first_name = "Lebron"
    # lebron.last_name = "James"
    # lebron.dob = 8.years.ago.to_date
    # lebron.cell_phone = "4122323232"
    # lebron.email = "Lebron.james@gmail.com"
    # lebron.grade = 3
    # lebron.gender = "M"
    # lebron.emergency_contact_name = "Mommy James"
    # lebron.emergency_contact_phone = "4122184777"
    # lebron.has_birth_certificate = true
    # lebron.allergies = "Bees"
    # lebron.security_question = "What is your nba team"
    # lebron.security_response = "cavs"
    # lebron.active = true
    # lebron.save!

    # Step 7: Create some brackets
    boys1 = Bracket.new
    boys1.gender = "male"
    boys1.tournament_id = fifteen.id
    boys1.min_age = 7
    boys1.max_age = 9
    boys1.max_students = 100
    boys1.save!

    boys2 = Bracket.new
    boys2.gender = "male"
    boys2.tournament_id = fifteen.id
    boys2.min_age = 10
    boys2.max_age = 12
    boys2.max_students = 100
    boys2.save!

    boys3 = Bracket.new
    boys3.gender = "male"
    boys3.tournament_id = fifteen.id
    boys3.min_age = 13
    boys3.max_age = 15
    boys3.max_students = 100
    boys3.save!

    boys4 = Bracket.new
    boys4.gender = "male"
    boys4.tournament_id = fifteen.id
    boys4.min_age = 16
    boys4.max_age = 18
    boys4.max_students = 100
    boys4.save!

    girls1 = Bracket.new
    girls1.gender = "female"
    girls1.tournament_id = fifteen.id
    girls1.min_age = 7
    girls1.max_age = 18
    girls1.max_students = 100
    girls1.save!



    # Step 8: Create some registrations


    # Step 9: Create some teams
    # okc = Team.new
    # okc.name = "Thunder"
    # okc.max_students = 20
    # okc.bracket_id = boys1.id
    # okc.save!

    # nets = Team.new
    # nets.name = "Nets"
    # nets.max_students = 20
    # nets.bracket_id = boys1.id
    # nets.save!

    # Step 10: Create some roster spots
    # kdrs = RosterSpot.new
    # kdrs.team_id = okc.id
    # kdrs.student_id = kevindurant.id
    # kdrs.start_date = fifteen.start_date
    # kdrs.position = "Forward"
    # kdrs.save!

    # Step 11: Create some users
    sbuser = User.new
    sbuser.username = "scottbrooks"
    sbuser.role = "volunteer"
    sbuser.email = "scottbrooks@gmail.com"
    sbuser.active = true
    sbuser.password = "secret"
    sbuser.password_confirmation = "secret"
    sbuser.save!
    
    admintest = User.new
    admintest.username = "admintest"
    admintest.role = "admin"
    admintest.email = "aswilson@andrew.cmu.edu"
    admintest.active = true
    admintest.password = "charliesangels"
    admintest.password_confirmation = "charliesangels"
    # admintest.volunteer_id = alliewilson.id
    admintest.save!

    tasha_admin = User.new
    tasha_admin.username = "admin"
    tasha_admin.role = "admin"
    tasha_admin.email = "lwilson@batchfoundation.org"
    tasha_admin.active = true
    tasha_admin.password = "2000West"
    tasha_admin.password_confirmation = "2000West"
    # tasha_admin.volunteer_id = tasha.id
    tasha_admin.save!

    

    # Step 12: Create some volunteers
    tasha = Volunteer.new
    tasha.gender = "female"
    tasha.age_range = "25-39"
    tasha.team_id = 1
    tasha.role = "Administrator"
    tasha.email = "aswilson@andrew.cmu.edu"
    tasha.first_name = "Latasha"
    tasha.last_name = "Wilson-Batch"
    tasha.cell_phone = "4108889999"
    tasha.shirt_size = "S"
    tasha.dob = Date.new(1980,6,14)
    tasha.street = "4 Forbes Ave"
    tasha.city = "Pittsburgh"
    tasha.state = "PA"
    tasha.zip = "15289"
    tasha.day_phone = "2139193454"
    tasha.receives_text_msgs = false
    tasha.active = true
    tasha.user_id = tasha_admin.id
    tasha.years_with_proj_chuck = 0
    tasha.act33_clearance = true
    tasha.act34_clearance = true
    tasha.act153_clearance = true
    tasha.save!

    #Ruth
    ruth_admin = User.new
    ruth_admin.username = "ruth_admin"
    ruth_admin.role = "admin"
    ruth_admin.email = "ruth.sk@batchfoundation.org"
    ruth_admin.active = true
    ruth_admin.password = "2000West"
    ruth_admin.password_confirmation = "2000West"
    ruth_admin.save!

    ruth = Volunteer.new
    ruth.gender = "female"
    ruth.age_range = "25-39"
    ruth.team_id = 1
    ruth.role = "Administrator"
    ruth.email = "ruth.sk@batchfoundation.org"
    ruth.first_name = "Ruth"
    ruth.last_name = "Spurlock Kim"
    ruth.cell_phone = "4108889999"
    ruth.shirt_size = "S"
    ruth.dob = Date.new(1980,6,14)
    ruth.street = "4 Forbes Ave"
    ruth.city = "Pittsburgh"
    ruth.state = "PA"
    ruth.zip = "15289"
    ruth.day_phone = "2139193454"
    ruth.receives_text_msgs = false
    ruth.active = true
    ruth.user_id = ruth_admin.id
    ruth.years_with_proj_chuck = 0
    ruth.act33_clearance = true
    ruth.act34_clearance = true
    ruth.act153_clearance = true
    ruth.save!

    #RyKai
    rykai_admin = User.new
    rykai_admin.username = "rykai_admin"
    rykai_admin.role = "admin"
    rykai_admin.email = "rwright@batchfoundation.org"
    rykai_admin.active = true
    rykai_admin.password = "2000West"
    rykai_admin.password_confirmation = "2000West"
    rykai_admin.save!

    rykai = Volunteer.new
    rykai.gender = "female"
    rykai.age_range = "18-24"
    rykai.team_id = 1
    rykai.role = "Administrator"
    rykai.email = "rwright@batchfoundation.org"
    rykai.first_name = "RyKai"
    rykai.last_name = "Wright"
    rykai.cell_phone = "4108889999"
    rykai.shirt_size = "S"
    rykai.dob = Date.new(19995,6,14)
    rykai.street = "4 Forbes Ave"
    rykai.city = "Pittsburgh"
    rykai.state = "PA"
    rykai.zip = "15289"
    rykai.day_phone = "2139193454"
    rykai.receives_text_msgs = false
    rykai.active = true
    rykai.user_id = rykai_admin.id
    rykai.years_with_proj_chuck = 0
    rykai.act33_clearance = true
    rykai.act34_clearance = true
    rykai.act153_clearance = true
    rykai.save!

    #Taylor
    taylor_admin = User.new
    taylor_admin.username = "taylor_admin"
    taylor_admin.role = "admin"
    taylor_admin.email = "tthorp@batchfoundation.org"
    taylor_admin.active = true
    taylor_admin.password = "2000West"
    taylor_admin.password_confirmation = "2000West"
    taylor_admin.save!

    taylor = Volunteer.new
    taylor.gender = "female"
    taylor.age_range = "25-39"
    taylor.team_id = 1
    taylor.role = "Administrator"
    taylor.email = "tthorp@batchfoundation.org"
    taylor.first_name = "Taylor"
    taylor.last_name = "Thorp"
    taylor.cell_phone = "4108889999"
    taylor.shirt_size = "S"
    taylor.dob = Date.new(1990,6,14)
    taylor.street = "4 Forbes Ave"
    taylor.city = "Pittsburgh"
    taylor.state = "PA"
    taylor.zip = "15289"
    taylor.day_phone = "2139193454"
    taylor.receives_text_msgs = false
    taylor.active = true
    taylor.user_id = taylor_admin.id
    taylor.years_with_proj_chuck = 0
    taylor.act33_clearance = true
    taylor.act34_clearance = true
    taylor.act153_clearance = true
    taylor.save!


    alliewilson = Volunteer.new
    alliewilson.gender = "female"
    alliewilson.age_range = "18-24"
    alliewilson.team_id = 1
    alliewilson.role = "Coach"
    alliewilson.email = "aswilson@andrew.cmu.edu"
    alliewilson.first_name = "Allie"
    alliewilson.last_name = "Wilson"
    alliewilson.cell_phone = "4107500575"
    alliewilson.shirt_size = "S"
    alliewilson.dob = Date.new(1970,6,14)
    alliewilson.street = "4 Forbes Ave"
    alliewilson.city = "Pittsburgh"
    alliewilson.state = "PA"
    alliewilson.zip = "15289"
    alliewilson.day_phone = "2139198858"
    alliewilson.receives_text_msgs = false
    alliewilson.active = true
    alliewilson.user_id = admintest.id
    alliewilson.years_with_proj_chuck = 0
    alliewilson.act33_clearance = true
    alliewilson.act34_clearance = true
    alliewilson.act153_clearance = true
    alliewilson.save!

    scottbrooks = Volunteer.new
    scottbrooks.gender = "male"
    scottbrooks.age_range = "40-59"
    scottbrooks.team_id = 1
    scottbrooks.role = "Coach"
    scottbrooks.email = "scottbrooks@gmail.com"
    scottbrooks.first_name = "Scott"
    scottbrooks.last_name = "Brooks"
    scottbrooks.cell_phone = "2139198232"
    scottbrooks.shirt_size = "L"
    scottbrooks.dob = Date.new(1970,6,14)
    scottbrooks.street = "4 Forbes Ave"
    scottbrooks.city = "Pittsburgh"
    scottbrooks.state = "PA"
    scottbrooks.zip = "15289"
    scottbrooks.day_phone = "2139198343"
    scottbrooks.receives_text_msgs = true
    scottbrooks.active = true
    scottbrooks.user_id = sbuser.id
    scottbrooks.years_with_proj_chuck = 0
    scottbrooks.act33_clearance = true
    scottbrooks.act34_clearance = true
    scottbrooks.act153_clearance = true
    scottbrooks.save!
    

    # Step 13: Create some games
    #game1 = Game.new
    #game1.location_id = cea.id
    #game1.date = Date.new(2015,6,14)
    #game1.save!
    
    # Step 14: Create some teams games
    # okcgame1 = TeamGame.new
    # okcgame1.game_id = game1.id
    # okcgame1.team_id = okc.id
    # okcgame1.score = "100"
    # okcgame1.save!

    # netsgame1 = TeamGame.new
    # netsgame1.game_id = game1.id
    # netsgame1.team_id = nets.id
    # netsgame1.score = "101"
    # netsgame1.save!
    
    #create teams
    nba_teams = ["Boston Celtics", "Brooklyn Nets", "NY Knicks", "Philidephia 76ers",
        "Toronto Raptors", "Golden State Warriors", "LA Clippers", "LA Lakers", "Pheonix Suns",
        "Sacramento Kings", "Chicago Bulls", "Cleveland Cavaliers", "Detroit Pistons", "Indiana Pacers", 
        "Mikwaukee Bucks", "Dallas Mavericks", "Houston Rockets", "Memphis Grizzlies", 
        "New Orleans Pelicans", "San Antonio Spurs", "Atlanta Hawks", "Charlotte Hornets", 
        "Miami Heat", "Orlando Magic", "Washington Wizards", "Denver Nuggets", "Minnesota Timberwolves", 
        "Oklahoma City Thunder", "Portland Trail Blazers", "Utah Jazz"]

    wnba_teams = ["Atlanta Dream", "Chicago Sky", "Connecticut Sun", "Indiana Fever", 
        "NY Liberty", "Washington Mystics", "LA Sparks", "Minnesota Lynx", "Pheonix Mercury", 
        "San Antonio Stars", "Seattle Storm", "Tulsa Shock"]

    nba_teams.each do |tname|
        team = Team.new
        team.name = tname
        team.max_students = 10
        team.bracket_id = [1,2,3,4].sample
        team.save!
    end

    wnba_teams.each do |tname|
        team = Team.new
        team.name = tname
        team.max_students = 10
        team.bracket_id = 5
        team.save!
    end

    #trying faker
    #create 70 households with 1-4 students in each
    5.times do |i|
        u = User.new
        u.username = Faker::Name.first_name + Faker::Name.first_name
        u.role = "guardian"
        u.email = "user@user.com"
        u.active = true
        u.password = "secret"
        u.password_confirmation = "secret"
        u.save!

        g = Guardian.new
        g.user = u
        g.first_name = Faker::Name.first_name
        g.last_name = Faker::Name.last_name
        g.email = u.email
        g.cell_phone = rand(10 ** 10).to_s.rjust(10,'0')
        g.receives_text_msgs = true
        g.active = true
        g.save!


        h = Household.new
        h.guardian = g
        h.street = Faker::Address.street_address
        h.city = Faker::Address.city 
        h.state = Faker::Address.state_abbr
        h.zip = %w[15120 15213 15212 15090 15237 15207 15217 15227 15203 15210].sample
        h.home_phone = rand(10 ** 10).to_s.rjust(10,'0')
        h.county = ['Allegheny', 'Armstrong', 'Beaver', 'Butler', 'City of Pittsburgh', 'Fayette', 'Greene', 'Indiana', 'Lawrence'].sample
        h.save!

        #create 1-4 students for each household
        #and registrations for each student
        num_kids = [1,2].sample
        num_kids.times do |j|
            s = Student.new
            s.household_id = h.id
            s.first_name = Faker::Name.first_name
            s.last_name = Faker::Name.last_name
            s.dob = Faker::Date.between(17.years.ago, 7.years.ago)
            s.cell_phone = rand(10 ** 10).to_s.rjust(10,'0')
            s.email = "#{s.first_name}.#{s.last_name}@example.com".downcase
            s.grade = (0..12).to_a.sample
            s.gpa = [1.0,2.0,3.0,4.0].sample
            s.pastparticipation = [0,0,0,1,2,3].sample
            s.school = ["Obama", "Sci Tech", "Perry"].sample
            s.district = ["Allegheny Valley School District","Avonworth School District",
                          "Baldwin-Whitehall School District","Bethel Park School District"].sample
            s.gender= ["male", "female"].sample
            s.emergency_contact_name = Faker::Name.name
            s.emergency_contact_phone = rand(10 ** 10).to_s.rjust(10,'0')
            s.emergency_contact_relation = ["Grandma", "Grandpa", "Neighbor", "Uncle", "Aunt"].sample
            s.has_birth_certificate = [true,false].sample
            s.allergies = ["Peanuts", "Tree Nuts", "Fish", "Eggs", "Kiwi"].sample
            s.security_question = Faker::Lorem.sentence
            s.security_response = Faker::Lorem.sentence
            # s.active = true #should be done by callback
            # s.has_report_card = [true,false].sample
            s.has_proof_of_insurance = [true,false].sample
            s.insurance_provider = ["UPMC", "Highmark", "HealthAmerica"].sample
            s.insurance_policy_no = rand(10 ** 10).to_s.rjust(10,'0')
            s.family_physician = Faker::Name.name
            s.physician_phone = rand(10 ** 10).to_s.rjust(10,'0')
            s.has_physical = [true,false].sample
            s.jersey_size = ["Youth-Large", "Youth-XL", "Adult-Small", "Adult-Medium", "Adult-Large", "Adult-XL"].sample
            s.physical_date = Faker::Date.backward(360)
            s.child_signature = "Child Signature"
            s.parent_signature = "Parent Signature"
            s.parent_consent_agree = true;
            s.parent_release_agree = true;
            s.parent_promise_agree = true;
            s.child_promise_agree = true;

            s.save!

            #create registration for each student
            # r = Registration.new
            # r.student_id = s.id
            # r.save!

        end

        #create 1 or 2 guardians for each household
        # num_gs = [1,2].sample
        # num_gs.times do |k|
        #     g = Guardian.new
        #     # g.household_id = h.id
        #     g.first_name = Faker::Name.first_name
        #     g.last_name = Faker::Name.last_name
        #     g.email = "#{g.first_name}.#{g.last_name}@example.com".downcase
        #     g.cell_phone = rand(10 ** 10).to_s.rjust(10,'0')
        #     g.receives_text_msgs = true
        #     g.active = true
        #     g.save!
        # end
                


    end


    end
end
