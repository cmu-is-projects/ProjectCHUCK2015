require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:brackets)
  
end
