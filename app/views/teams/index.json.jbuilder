json.array!(@teams) do |team|
  json.extract! team, :id, :bracket_id, :name, :num_students, :max_students, :num_wins, :num_losses
  json.url team_url(team, format: :json)
end
