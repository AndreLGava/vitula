json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :laboratory, :reference, :presentation, :use, :composition, :indication, :contraindication, :warning, :interaction, :effect, :dosage, :overdosage, :properties, :species
  json.url drug_url(drug, format: :json)
end
