json.extract! @user,:id, :open_id, :avatar_url, :city, :wechat_name
# json.event do
#   json.id @user.event.id
#   json.description @user.event.description
#   json.start @user.event.start.strftime("%e %b %Y %H:%M:%S%p")
#   json.end @user.event.end.strftime("%e %b %Y %H:%M:%S%p")
#   json.capacity @user.event.capacity
#   json.completed @user.event.completed
#   json.address @user.event.address
# end

