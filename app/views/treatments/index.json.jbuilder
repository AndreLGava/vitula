json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :startdate, :enddate, :dosage, :lack
  json.url treatment_url(treatment, format: :json)
end
