json.array!(@households) do |household|
  json.extract! household, :id, :street, :city, :state, :zip, :home_phone, :county, :active
  json.url household_url(household, format: :json)
end
