json.array!(@productions) do |production|
  json.extract! production, :id, :amount, :measurement, :observation, :animal_id
  json.url production_url(production, format: :json)
end
