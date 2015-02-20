require 'test_helper'

class RosterSpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:student)
  should belong_to(:team)
  
end
