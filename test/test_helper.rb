ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov' #simplecov gem for basic test coverage statistics
SimpleCov.start 'rails'
require 'turn/autorun' #gem to format unit test output


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all <- set the use of transactional fixtures to false by commenting out as per 272 instructions

  # Add more helper methods to be used by all tests here...

  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end
  
  def create_locs
    @barclays = FactoryGirl.create(:location, name:"Barclays Center", street:"Atlantic Avenue", city:"New York", state: "NY", zip:"11217")
    @tdgarden = FactoryGirl.create(:location, name:"TD Garden",street:"Legends Way", city:"Boston", state:"MA", zip:"02114")
    @msg = FactoryGirl.create(:location, name:"Madison Square Garden", street: "Penn Plaza", city:"New York", state:"NY", zip:"10001")
  end
  def remove_locs
    @barclays.destroy
    @tdgarden.destroy
    @msg.destroy
  end

  def create_tournaments
    #@nba = FactoryGirl.create(:tournament, name:"NBA Championship", start_date:"")
  end 
  def remove_tournaments

  end 

  def create_students

  end



  def create_context
    #schools
    @perry = FactoryGirl.create(:school, name: "Perry Highschool", district: "Pittsburgh Public Schools", county: "Allegheny")
    @scitech = FactoryGirl.create(:school, name: "Scitech Academy", district: "Pittsburgh Public Schools", county: "Other")
    @obama = FactoryGirl.create(:school, name: "Obama 6-12", district: "Other", county: "Other")
 
    #households
    @kevins = FactoryGirl.create(:household, county: "Greene", phone: "4127735465")
    @first = FactoryGirl.create(:household, street: "2 First Ave", county:"Butler", state: "PA", zip:"15289", phone: "5552364537")
    @old = FactoryGirl.create(:household, county: "Greene", phone: "4123376677", street: "50 Old Dr", active: false)
    
    #guardians
    #@shaq = 

    #students
    @kd = FactoryGirl.create(:student, household: @main)
    @klove = FactoryGirl.create(:student, household: @first, first_name: "Sue", last_name: "Jones", emergency_contact_name: "Michael Jones", dob: 12.years.ago.to_date, grade: 6, gender: "female", has_birth_certificate: false, active: false)
    
    #users, need volunteer
    #@userv = FactoryGirl.create(:user, volunteer: )
    #@userc = FactoryGirl.create(:user, volunteer: , username: "itsme", role: "coach", email: "itsme@gmail.com")
   # @useri = FactoryGirl.create(:user, volunteer: , username: "olduser", email: "olduser@gmail.com", active: false)

  end
  
  def remove_context
    @perry.destroy
    @scitech.destroy
    @obama.destroy

    @main.destroy
    @first.destroy
    @old.destroy
    
  #  @joe.destroy
   # @sue.destroy
    
   # @userc.destroy
   # @userv.destroy
   # @useri.destroy
    
  end


end

# Formatting test output a little nicer
Turn.config.format = :outline