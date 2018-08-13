json.users do
  json.array! @users do |user|
    json.id user.id
    json.open_id user.open_id
    json.wechat_name user.wechat_name
    json.avatar_url user.avatar_url
    json.city user.city
  end
end

