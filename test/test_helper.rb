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
    create_students
    create_brackets
    create_registrations
    create_teams
    create_roster_spots
    create_team_games
    create_volunteers
    create_users
  end
  
  def remove_overarching_context
    destroy_tournaments
    destroy_schools
    destroy_households
    destroy_guardians
    destroy_locations
    destroy_games
    destroy_students
    destroy_brackets
    destroy_registrations
    destroy_teams
    destroy_roster_spots
    destroy_team_games
    destroy_volunteers
    destroy_users
  end


end

# Formatting test output a little nicer
Turn.config.format = :outline