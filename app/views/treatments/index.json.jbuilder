json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :StartDate, :EndDate, :dosage, :lack
  json.url treatment_url(treatment, format: :json)
end
