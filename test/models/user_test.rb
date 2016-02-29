require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should have_one(:volunteer)
  
#  #validations
#  should validate_presence_of(:username)
#  should validate_uniqueness_of(:username)
#  should validate_presence_of(:password_digest)
#  
#  should allow_value("name@me.com").for(:email)
#  should allow_value("me@andrew.cmu.edu").for(:email)
#  should allow_value("my_name@me.org").for(:email)
#  should allow_value("name123@me.gov").for(:email)
#  should allow_value("my.name@me.net").for(:email)
#  
#  #should_not allow_value(nil).for(:email)
#  should_not allow_value("name").for(:email)
#  should_not allow_value("name@me,com").for(:email)
#  should_not allow_value("name@me.uk").for(:email)
#  should_not allow_value("my name@me.com").for(:email)
#  should_not allow_value("name@me.con").for(:email)
#  
#  should allow_value("administrator").for(:role)
#  should allow_value("volunteer").for(:role)
#  should allow_value("coach").for(:role)
#  
#  should_not allow_value("admin").for(:role)
#  should_not allow_value("member").for(:role)
#  should_not allow_value(nil).for(:role)
  
# context "With a proper context, " do
#   
#   setup do
#     create_context
#   end
#   
#   teardown do
#     remove_context
#   end 
#   
#   should "show that all factory objects are properly created" do
#     assert_equal "user123", @userv.username
#     assert_equal "itsme", @userc.username
#     assert_equal "olduser", @useri.username
#   end
#   
# #scopes
# 
# should "sort users in alphabetical order" do
#   assert_equal ["itsme", "olduser","user123"], User.alphabetical.map(&:username)
# end
# 
# should "show that there are active users" do
#   assert_equal ["user123","itsme"], User.active.map(&:username)
# end
# 
# should "show that there are inactive users" do
#   assert_equal ["olduser"], User.inactive.map(&:username)
# end
# 
# should "show that there are users of a certain role" do
#   assert_equal ["user123","olduser"], User.by_role("volunteer").map(&:username)
#   assert_equal ["itsme"], User.by_role("coach").map(&:username)
# end
# 
# #password methods
# 
#end
end
