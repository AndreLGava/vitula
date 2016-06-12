json.array!(@permissions) do |permission|
  json.extract! permission, :id, :create, :read, :update, :delete, :print, :modulo_id, :functionality_id
  json.url permission_url(permission, format: :json)
end
