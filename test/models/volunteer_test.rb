require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:user)
  should belong_to(:team)
end
