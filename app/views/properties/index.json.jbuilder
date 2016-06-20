json.array!(@properties) do |property|
  json.extract! property, :id, :name, :description, :long, :lat
  json.url property_url(property, format: :json)
end
