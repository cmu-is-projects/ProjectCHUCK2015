require 'test_helper'

class BracketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:teams)
  should belong_to(:tournament)
  should have_many(:registrations)
  
end
