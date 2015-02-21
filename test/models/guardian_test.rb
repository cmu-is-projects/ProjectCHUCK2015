require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:household)
  should have_one(:user)
  should have_many(:students).through(:households)
  
end
