require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to(:bracket)
  should belong_to(:student)
  
end
