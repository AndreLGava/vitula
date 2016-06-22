json.array!(@reproductions) do |reproduction|
  json.extract! reproduction, :id, :heat, :insemination, :regress, :abortion, :parturition, :animal_id, :animal_id, :stop_breastfeeding
  json.url reproduction_url(reproduction, format: :json)
end
