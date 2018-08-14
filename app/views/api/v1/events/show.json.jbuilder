json.extract! @event, :id, :description, :start, :end, :capacity, :completed, :address, :latitude, :longitude, :imageUrl
json.user do
  json.id @event.user.id
  json.wechat_name @event.user.wechat_name
  json.avatar_url @event.user.avatar_url
end
