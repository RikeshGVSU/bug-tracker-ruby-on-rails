json.extract! user, :id, :fname, :lname, :email, :thumbnail, :created_at, :updated_at
json.url user_url(user, format: :json)
