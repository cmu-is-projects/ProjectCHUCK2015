json.array!(@schools) do |school|
  json.extract! school, :id, :name, :district, :county
  json.url school_url(school, format: :json)
end
