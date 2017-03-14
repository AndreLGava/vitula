json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :startdate, :enddate, :dosage, :lack, :observation, :disease_id, :drug_id
  json.url treatment_url(treatment, format: :json)
end
