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