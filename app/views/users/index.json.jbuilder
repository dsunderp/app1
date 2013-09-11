json.array!(@users) do |user|
  json.extract! user, :username, :password, :profile_type, :name, :skills
  json.url user_url(user, format: :json)
end