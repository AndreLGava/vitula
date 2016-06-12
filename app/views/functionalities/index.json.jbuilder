json.array!(@functionalities) do |functionality|
  json.extract! functionality, :id, :name, :description, :modulo_id
  json.url functionality_url(functionality, format: :json)
end
