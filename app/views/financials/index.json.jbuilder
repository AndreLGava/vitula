json.array!(@financials) do |financial|
  json.extract! financial, :id, :value, :datetransaction, :operation, :description, :animal_id, :service_id, :employee_id, :reproduction_id, :stock_id, :treatment_id, :shipment_id, :schedule_id, :service_id
  json.url financial_url(financial, format: :json)
end
