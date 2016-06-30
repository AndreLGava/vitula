json.array!(@notifications) do |notification|
  json.extract! notification, :id, :title, :description, :read, :limit, :user_id
  json.url notification_url(notification, format: :json)
end
