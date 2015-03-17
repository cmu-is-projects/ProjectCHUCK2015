require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:guardians)
  should have_many(:students)
  
#  #validations
#  should allow_value("4122680000").for(:home_phone)  
#  should allow_value("412-268-0000").for(:home_phone)  
#  should allow_value("412.268.0000").for(:home_phone)  
#  should allow_value("(412) 268-0000").for(:home_phone)  
#  
#  #should_not allow_value(nil).for(:home_phone)    
#  should_not allow_value("2680000").for(:home_phone)  
#  should_not allow_value("4122680000x224").for(:home_phone)  
#  should_not allow_value("800-EAT-FOOD").for(:home_phone)  
#  should_not allow_value("412/268/0000").for(:home_phone)  
#  should_not allow_value("412-2683-259").for(:home_phone)
#  
#  should allow_value("15213").for(:zip)
#  should allow_value("21044").for(:zip)
#  should allow_value("71389").for(:zip)
#  
#  #should_not allow_value(nil).for(:zip_code)
#  should_not allow_value("152132").for(:zip)
#  should_not allow_value("1521").for(:zip)
#  
#  should allow_value("PA").for(:state)
#  should allow_value("WV").for(:state)
#  
#  #should_not allow_value(nil).for(:state)
#  should_not allow_value("").for(:state)
#  should_not allow_value("").for(:state)
#  should_not allow_value("").for(:state)
#  
#  should allow_value("Allegheny").for(:county)
#  should allow_value("Beaver").for(:county)
#  
#  #should_not allow_value(nil).for(:county)
#  should_not allow_value("Pittsburgh").for(:county)
#  should_not allow_value("Alegeny").for(:county)
#  should_not allow_value("").for(:county)
#  
#  context "With a proper context, " do
#    
#    setup do
#      create_context
#    end
#    
#    teardown do
#      remove_context
#    end 
#    
#    should "show that all factory objects are properly created" do
#      assert_equal "100 Main St", @main.street
#      assert_equal "2 First Ave", @first.street
#      assert_equal "50 Old Dr", @old.street
#    end
#    
#  #scopes, switch to mapping to guardian last name
#  should "show that there are active households" do
#    assert_equal ["100 Main St", "2 First Ave"], Household.active.map(&:street)
#  end
#  
#  should "show that there are inactive households" do
#    assert_equal ["50 Old Dr"], Household.inactive.map(&:street)
#  end
  
  #methods - get_city?
end
  
end
