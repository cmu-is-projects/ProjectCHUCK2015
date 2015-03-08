require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:roster_spots)
  should have_many(:volunteers)
  should belong_to(:bracket)
  should have_many(:team_games)
  should have_many(:students).through(:roster_spots)
  should have_many(:games).through(:team_games)
  
end
