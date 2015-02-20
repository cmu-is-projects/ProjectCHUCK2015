require 'test_helper'

class TeamGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:team)
  should belong_to(:game)
  should have_many(:coaches).through(:teams)
  should have_many(:roster_spots).through(:teams)
  
end
