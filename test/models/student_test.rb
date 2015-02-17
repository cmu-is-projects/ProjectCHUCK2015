require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #relationship validations
  should belong_to (:household)
  should belong_to (:school)
  should have_many(:rosterspots)
  should have_many(:registrations)
  should have_many(:teams).through(:rosterspots)
  should have_many(:guardians).through(:household)


end
