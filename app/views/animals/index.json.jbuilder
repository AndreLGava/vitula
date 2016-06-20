json.array!(@animals) do |animal|
  json.extract! animal, :id, :code, :name, :description, :born, :female, :breed, :lot_id, :reproduction_id
  json.url animal_url(animal, format: :json)
end
