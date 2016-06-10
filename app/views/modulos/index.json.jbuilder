json.array!(@modulos) do |modulo|
  json.extract! modulo, :id, :name, :description
  json.url modulo_url(modulo, format: :json)
end
