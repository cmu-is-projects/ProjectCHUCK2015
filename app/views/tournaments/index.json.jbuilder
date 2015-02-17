json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :start_date, :end_date
  json.url tournament_url(tournament, format: :json)
end
