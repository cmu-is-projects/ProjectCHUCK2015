# require needed files
require './test/sets/brackets'
require './test/sets/games'
require './test/sets/guardians'
require './test/sets/households'
require './test/sets/locations'
require './test/sets/registrations'
require './test/sets/roster_spots'
require './test/sets/schools'
require './test/sets/students'
require './test/sets/team_games'
require './test/sets/teams'
require './test/sets/tournaments'
require './test/sets/users'
require './test/sets/volunteers'

module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::Brackets
  include Contexts::Games
  include Contexts::Guardians
  include Contexts::Households
  include Contexts::Locations
  include Contexts::Registrations
  include Contexts::RosterSpots
  include Contexts::Schools
  include Contexts::Students
  include Contexts::TeamGames
  include Contexts::Teams
  include Contexts::Tournaments
  include Contexts::Users
  include Contexts::Volunteers
end