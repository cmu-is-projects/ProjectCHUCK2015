FactoryGirl.define do
  #schools
  factory :school do
   name "Park Elementary School"
   district "Steel Valley"
   county "Allegheny"
  end

  #students
  factory :student do
    association :household
    association :school
    first_name "Joe"
    last_name "Smith"
    dob 8.years.ago.to_date
    cell_phone "4120000000"
    email "joe_smith@comcast.net"
    grade 9
    gender "male"
    emergency_contact_name "Jane Smith"
    emergency_contact_phone "412-000-0000"
    has_birth_certificate true
    allergies "none"
    medications "none"
    security_question "What is your dog's name?"
    security_response "Spot"
    parent_consent_agree true
    parent_promise_agree true
    parent_release_agree true
    child_promise_agree true
    active true
    emergency_contact_relation "parent"
    insurance_provider "UPMC"
    insurance_policy_no 1
    family_physician "Dr. Smith"
    physical_date Date.today
    child_signature "Me."
    jersey_size "Youth-Medium"
  end
  
  #households
  factory :household do
    street "100 Main St"
    city "Pittsburgh"
    state "PA"
    zip "15213"
    home_phone "412-000-0000"
    county "Allegheny"
    active true
  end

  #guardian
  factory :guardian do
    association :household
    email "name@cmu.edu"
    first_name "Jane"
    last_name "Doe"
    cell_phone "412-678-9000"
    receives_text_msgs true
    active true
  end
  
  #users
  factory :user do
    username "user123"
    role "volunteer"
    email "user123@user.com"
    password "secret"
    password_confirmation "secret"
    active true
  end

  #volunteer
  factory :volunteer do
    association :user
    association :team
    role "Volunteer"
    email "pranz@cmu.edu"
    first_name "Pranita"
    last_name "Ramakrishnan"
    cell_phone "571-478-3829"
    receives_text_msgs true
    active true
    dob Date.today
    street "5000 Forbes Ave"
    city "Pittsburgh"
    state "PA"
    zip 15213
    day_phone 1234567890
    shirt_size "M"
  end

  #tournament
  factory :tournament do
    name "Project CHUCK Summer Tournament"
    description "Continuously Helping to Uplift City Kids"
    start_date 1.years.ago.to_date
    end_date nil
  end

  #bracket
  factory :bracket do
    association :tournament
    gender "male"
    min_age 7
    max_age 10
    max_students 100
    name "Boys 7-10"
  end

  #registration
  factory :registration do
    association :student
    association :bracket
    active true
  end

  #games
  factory :games do
    date Date.today
    association :location
  end

  #teams
  factory :team do
    association :bracket
    name "Steelers"
    max_students 10
    num_wins 0
    num_losses 0
  end

  #roster_spots
  factory :roster_spot do
    association :team
    association :student
    jersey_number 1
    active true
  end

  #team_games
  factory :team_game do
    association :game
    association :team
    score 0
  end

  #locations
  factory :location do
    street "123 Learning Ave"
    city "Pittsburgh"
    state "PA"
    zip "15213"
    active true
    name "School!"
  end

  #games
  factory :game do
    association :location
    date Date.today
  end

end