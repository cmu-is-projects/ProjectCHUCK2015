FactoryGirl.define do
  
  #students
  factory :student do
    association :household
    association :school
    first_name "Joe"
    last_name "Smith"
    dob 15.years.go.to_date
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
  
  #users
  factory :user do
    association :volunteer
    username "user123"
    role "volunteer"
    email "user123@user.com"
    password_digest "secret"
    active true
  end
