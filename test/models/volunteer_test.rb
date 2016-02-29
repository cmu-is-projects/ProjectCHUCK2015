require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:user)
  should belong_to(:team)

  # test validations
  # should validate_presence_of(:first_name)
  # should validate_presence_of(:last_name)
  # should validate_presence_of(:cell_phone)

  # should allow_value("fred@fred.com").for(:email)
  # should allow_value("fred@andrew.cmu.edu").for(:email)
  # should allow_value("my_fred@fred.org").for(:email)
  # should allow_value("fred123@fred.gov").for(:email)
  # should allow_value("my.fred@fred.net").for(:email)
  
  # should_not allow_value("fred").for(:email)
  # should_not allow_value("fred@fred,com").for(:email)
  # should_not allow_value("fred@fred.uk").for(:email)
  # should_not allow_value("my fred@fred.com").for(:email)
  # should_not allow_value("fred@fred.con").for(:email)
  
  # should allow_value("4122683259").for(:cell_phone)
  # should allow_value("412-268-3259").for(:cell_phone)
  # should allow_value("412.268.3259").for(:cell_phone)
  # should allow_value("(412) 268-3259").for(:cell_phone)
  
  # should_not allow_value("2683259").for(:cell_phone)
  # should_not allow_value("4122683259x224").for(:cell_phone)
  # should_not allow_value("800-EAT-FOOD").for(:cell_phone)
  # should_not allow_value("412/268/3259").for(:cell_phone)
  # should_not allow_value("412-2683-259").for(:cell_phone)

  
end
