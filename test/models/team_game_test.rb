require 'test_helper'

class TeamGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:team)
  should belong_to(:game)
  
end
