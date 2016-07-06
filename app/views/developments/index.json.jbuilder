json.array!(@developments) do |development|
  json.extract! development, :id, :weight, :height, :animal_id
  json.url development_url(development, format: :json)
end
