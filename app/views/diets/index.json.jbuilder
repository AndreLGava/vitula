json.array!(@diets) do |diet|
  json.extract! diet, :id, :amount, :datestart, :dateend, :animal_id, :stock_id
  json.url diet_url(diet, format: :json)
end
