require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #relationships
  should belong_to(:household)
  should belong_to(:school)
  should have_many(:roster_spots)
  should have_many(:registrations)
  should have_many(:brackets).through(:registrations)
  should have_many(:teams).through(:roster_spots)
  
  #validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:gender)
  should validate_presence_of(:emergency_contact_name)
  # should validate_presence_of(:household_id)
  should validate_presence_of(:school_id)
  should validate_presence_of(:emergency_contact_phone)
  
  should allow_value("name@me.com").for(:email)
  should allow_value("me@andrew.cmu.edu").for(:email)
  should allow_value("my_name@me.org").for(:email)
  should allow_value("name123@me.gov").for(:email)
  should allow_value("my.name@me.net").for(:email)
  should allow_value(nil).for(:email)
  
  should_not allow_value("name").for(:email)
  should_not allow_value("name@me,com").for(:email)
  should_not allow_value("name@me.uk").for(:email)
  should_not allow_value("my name@me.com").for(:email)
  should_not allow_value("name@me.con").for(:email)
  
  should allow_value("4122680000").for(:cell_phone)
  should allow_value("412-268-0000").for(:cell_phone)
  should allow_value("412.268.0000").for(:cell_phone)
  should allow_value("(412) 268-0000").for(:cell_phone)
  should allow_value(nil).for(:cell_phone)
  
  should_not allow_value("2680000").for(:cell_phone)
  should_not allow_value("4122680000x224").for(:cell_phone)
  should_not allow_value("800-EAT-FOOD").for(:cell_phone)
  should_not allow_value("412/268/0000").for(:cell_phone)
  should_not allow_value("412-2683-259").for(:cell_phone)
  
  should allow_value("4122680000").for(:emergency_contact_phone)
  should allow_value("412-268-0000").for(:emergency_contact_phone)
  should allow_value("412.268.0000").for(:emergency_contact_phone)
  should allow_value("(412) 268-0000").for(:emergency_contact_phone)
  
  should_not allow_value("2680000").for(:emergency_contact_phone)
  should_not allow_value("4122680000x224").for(:emergency_contact_phone)
  should_not allow_value("800-EAT-FOOD").for(:emergency_contact_phone)
  should_not allow_value("412/268/0000").for(:emergency_contact_phone)
  should_not allow_value("412-2683-259").for(:emergency_contact_phone)
  should_not allow_value(nil).for(:emergency_contact_phone)

  should allow_value(15.years.ago.to_date).for(:dob) 
  should allow_value(18.years.ago.to_date).for(:dob) 
  should allow_value(6.years.ago.to_date).for(:dob) 
  should_not allow_value(2.days.ago.to_date).for(:dob)
  should_not allow_value(19.years.ago.to_date).for(:dob)
  should_not allow_value("bad").for(:dob)
  should_not allow_value(2).for(:dob)
  should_not allow_value(3.14159).for(:dob)
  should_not allow_value(nil).for(:dob)
  should_not allow_value(Date.today).for(:dob)
  should_not allow_value(1.day.from_now.to_date).for(:dob)
  
  should allow_value(1).for(:grade)
  should allow_value(0).for(:grade)
  should allow_value(11).for(:grade)
  should_not allow_value("first").for(:grade)
  should_not allow_value(-2).for(:grade)
  should_not allow_value(15).for(:grade)
  should_not allow_value(nil).for(:grade)
  
  
# context "With a proper context, " do
 
#  setup do
#    create_context
#  end
 
#  teardown do
#    remove_context
#  end 

 # should "show that all factory objects are properly created" do
 #   assert_equal "Smith, Joe", @joe.name
 #   assert_equal "Jones, Sue", @sue.name
 # end
#  
##scopes
#
#should "sort students in alphabetical order" do
#  assert_equal ["Jones, Sue", "Smith, Joe"], Student.alphabetical.map(&:name)
#end
#
#should "show that there are active students" do
#  assert_equal ["Smith, Joe"], Student.active.map(&:name)
#end
#
#should "show that there are inactive students" do
#  assert_equal ["Jones, Sue"], Student.inactive.map(&:name)
#end
#
#should "show all students attending a certain school" do
#  assert_equal [], Student.by_school.map(&:name)
#end
#
#should "show all students that are missing their birth certificate" do
#  assert_equal ["Jones, Sue"], Student.missing_birthcert.map(&:name)
#end
#
#should "show all students in a certain grade" do
#  assert_equal ["Smith, Joe"], Student.grade(9).map(&:name)
#  assert_equal ["Jones, Sue"], Student.grade(6).map(&:name)
#end
#
#should "show all students of a particular gender" do
#  assert_equal ["Smith, Joe"], Student.gender("male").map(&:name)
#  assert_equal ["Jones, Sue"], Student.gender("female").map(&:name)
#end
#
##methods
#
#should "have a working age method" do
#  assert_equal 15, @joe.age
#  assert_equal 12, @sue.age
#end
#
#should "have a working proper name method" do
#  assert_equal "Joe Smith", @joe.proper_name
#  assert_equal "Sue Jones", @sue.proper_name
#end
#
#should "have a working name method" do
#  assert_equal "Smith, Joe", @joe.name
#  assert_equal "Jones, Sue", @sue.name
#end
  
# end

end
