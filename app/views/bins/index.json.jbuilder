json.array!(@bins) do |bin|
  json.extract! bin, :id, :capacity, :property_id, :kind
  json.url bin_url(bin, format: :json)
end
