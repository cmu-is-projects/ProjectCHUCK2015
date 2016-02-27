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
    dob 15.years.ago.to_date
    cell_phone "412-000-000"
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
    active true
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
    relation "mother"
    email "name@cmu.edu"
    first_name "Jane"
    last_name "Doe"
    cell_phone "412-678-9000"
    receives_text_msgs true
    active true
  end
  
  #users
  factory :user do
    association :volunteer
    username "user123"
    role "volunteer"
    email "user123@user.com"
    password_digest "secret"
    active true
  end

  #volunteer
  factory :volunteer do
    association :team
    role "volunteer"
    email "pranz@cmu.edu"
    first_name "Pranita"
    last_name "Ramakrishnan"
    cell_phone "571-478-3829"
    receives_text_msgs true
    active true
  end

  #tournament
  factory :tournament do
    name "Project CHUCK Summer Tournament"
    description "Continuously Helping to Uplift City Kids"
    start_date 1.years.ago.to_date
    end_date 1.years.from_now.to_date
  end

  #bracket
  factory :bracket do
    association :tournament
    gender "male"
    min_age 7
    max_age 10
    max_students 100
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
  factory :teams do
    assocation :bracket
    name "Steelers"
    max_students 10
    num_wins 0
    num_losses 0
  end
end