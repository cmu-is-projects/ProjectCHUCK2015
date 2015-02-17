json.array!(@games) do |game|
  json.extract! game, :id, :team1_score, :team2_score, :date
  json.url game_url(game, format: :json)
end
