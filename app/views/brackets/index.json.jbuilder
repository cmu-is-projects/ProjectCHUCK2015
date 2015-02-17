json.array!(@brackets) do |bracket|
  json.extract! bracket, :id, :tournament_id, :gender, :min_age, :max_age
  json.url bracket_url(bracket, format: :json)
end
