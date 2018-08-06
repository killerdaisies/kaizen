json.users do
  json.array! @users do |user|
    json.extract! user, :id, :open_id, :wechat_name, :avatar_url, :city
  end
end
