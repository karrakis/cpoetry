json.extract! user, :id, :id, :username, :auth_token, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
