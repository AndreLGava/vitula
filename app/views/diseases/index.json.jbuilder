json.array!(@diseases) do |disease|
  json.extract! disease, :id, :VulgarName, :CientificName, :Causes, :Description, :Symptoms
  json.url disease_url(disease, format: :json)
end
