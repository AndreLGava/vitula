json.array!(@illnesses) do |illness|
  json.extract! illness, :id, :StartDate, :EndDate, :sequel, :animal_id, :disease_id
  json.url illness_url(illness, format: :json)
end
