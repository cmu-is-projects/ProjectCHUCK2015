require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:location)
  should have_many(:team_games)
  should have_many(:teams).through(:team_games)
  
end
