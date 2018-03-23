json.extract! user, :id, :fullName, :department, :position, :email, :password, :activeKey, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
