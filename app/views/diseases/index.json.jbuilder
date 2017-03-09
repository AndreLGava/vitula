json.array!(@diseases) do |disease|
  json.extract! disease, :id, :vulgarname, :cientificname, :causes, :description, :symptoms
  json.url disease_url(disease, format: :json)
end
