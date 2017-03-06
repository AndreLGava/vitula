json.array!(@glebes) do |glebe|
  json.extract! glebe, :id, :name, :purpose, :area, :property_id
  json.url glebe_url(glebe, format: :json)
end
