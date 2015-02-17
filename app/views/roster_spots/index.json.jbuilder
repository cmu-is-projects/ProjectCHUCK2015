json.array!(@roster_spots) do |roster_spot|
  json.extract! roster_spot, :id, :team_id, :student_id, :start_date, :end_date, :position
  json.url roster_spot_url(roster_spot, format: :json)
end
