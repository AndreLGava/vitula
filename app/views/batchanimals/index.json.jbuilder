json.array!(@batchanimals) do |batchanimal|
  json.extract! batchanimal, :id, :animal_id, :batch_id
  json.url batchanimal_url(batchanimal, format: :json)
end
