json.array!(@team_games) do |team_game|
  json.extract! team_game, :id, :game_id, :team_id
  json.url team_game_url(team_game, format: :json)
end
