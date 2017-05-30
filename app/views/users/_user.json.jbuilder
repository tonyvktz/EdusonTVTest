json.extract! user, :id, :name, :login, :is_admin, :user_group_id, :created_at, :updated_at
json.url user_url(user, format: :json)
