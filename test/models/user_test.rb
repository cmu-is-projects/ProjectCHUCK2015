require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_many(:coaches)
  should have_one(:guardian)
  
end
