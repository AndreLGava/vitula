json.array!(@funcionalities) do |funcionality|
  json.extract! funcionality, :id, :name, :description, :modulo_id
  json.url funcionality_url(funcionality, format: :json)
end
