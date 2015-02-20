require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:roster_spots)
  should have_many(:coaches)
  should belong_to(:bracket)
  should have_many(:team_games)
  should have_many(:registrations).through(:brackets)
  
end
