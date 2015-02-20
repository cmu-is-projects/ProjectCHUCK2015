require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:guardians)
  should have_man(:students)
  
end
