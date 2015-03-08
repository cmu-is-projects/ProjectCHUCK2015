json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :user_id, :team_id
  json.url volunteer_url(volunteer, format: :json)
end
