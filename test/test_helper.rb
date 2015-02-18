ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov' #simplecov gem for basic test coverage statistics
SimpleCov.start 'rails'
require 'turn/autorun' #gem to format unit test output


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  #fixtures :all <- set the use of transactional fixtures to false by commenting out as per 272 instructions

  # Add more helper methods to be used by all tests here...
end

# Formatting test output a little nicer
Turn.config.format = :outline