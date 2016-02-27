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
    create_tournaments
    create_schools
    create_households
    create_guardians
    create_locations
    create_games
    create_brackets
    create_students
    create_registrations
    create_teams
    create_roster_spots
    create_team_games
    create_users
    create_volunteers
  end
  
  def remove_overarching_context
    remove_volunteers
    remove_users
    remove_team_games
    remove_roster_spots
    remove_teams
    remove_registrations
    remove_brackets
    remove_students
    remove_games
    remove_locations
    remove_guardians
    remove_households
    remove_schools
    remove_tournaments
  end


end

# Formatting test output a little nicer
Turn.config.format = :outline