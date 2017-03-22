json.array!(@shipments) do |shipment|
  json.extract! shipment, :id, :amount, :date
  json.url shipment_url(shipment, format: :json)
end
