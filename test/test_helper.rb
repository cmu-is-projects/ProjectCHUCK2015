ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov' #simplecov gem for basic test coverage statistics
SimpleCov.start 'rails'
require 'turn/autorun' #gem to format unit test output
require 'contexts'


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Add more helper methods to be used by all tests here...
  # start by including the Contexts module
  include Contexts

  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end

  def create_overarching_context

  end
  
  def remove_overarching_context
    
  end


end

# Formatting test output a little nicer
Turn.config.format = :outline