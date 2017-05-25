json.array!(@batches) do |batch|
  json.extract! batch, :id, :name, :observation, :type, :formation, :glebe_id
  json.url batch_url(batch, format: :json)
end
