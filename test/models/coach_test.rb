require 'test_helper'

class CoachTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to (:user)
  should belong_to (:team)
end
