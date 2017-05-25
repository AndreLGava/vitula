json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :event_id, :batch_id, :datestart, :dateend, :observation
  json.url schedule_url(schedule, format: :json)
end
