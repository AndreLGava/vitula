json.array!(@illnesses) do |illness|
  json.extract! illness, :id, :startdate, :enddate, :sequel, :animal_id, :disease_id, :treatment_id
  json.url illness_url(illness, format: :json)
end
