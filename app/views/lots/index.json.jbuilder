json.array!(@lots) do |lot|
  json.extract! lot, :id, :name, :description, :property_id
  json.url lot_url(lot, format: :json)
end
