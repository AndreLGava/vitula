json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :StartDate, :EndDate, :dosage, :lack, :illness_id
  json.url treatment_url(treatment, format: :json)
end
