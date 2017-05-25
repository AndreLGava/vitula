json.array!(@services) do |service|
  json.extract! service, :id, :provider, :goal, :property_id
  json.url service_url(service, format: :json)
end
