require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #relationships
  should belong_to(:household)
  should belong_to(:school)
  should have_many(:roster_spots)
  should have_many(:registrations)
  should have_many(:brackets).through(:registrations)
  should have_many(:teams).through(:roster_spots)
end
