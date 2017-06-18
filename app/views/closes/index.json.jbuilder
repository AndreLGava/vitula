json.array!(@closes) do |close|
  json.extract! close, :id, :dateclosing, :totalvalue
  json.url close_url(close, format: :json)
end
