require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  #relationship tests
  should have_many(:games)

  #validation tests
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_presence_of(:zip)
  should validate_presence_of(:state)

  #zip format tests
  should allow_value("03006").for(:zip)
  should allow_value("15289").for(:zip)
  should allow_value("15090").for(:zip)
  
  should_not allow_value("charlie").for(:zip)
  should_not allow_value("1234").for(:zip)
  should_not allow_value("15213-9843").for(:zip)
  should_not allow_value("15d32").for(:zip)
  should_not allow_value(nil).for(:zip)

 
  
end
