json.array!(@locations) do |location|
  json.extract! location, :id, :street, :city, :zip, :state, :active
  json.url location_url(location, format: :json)
end
