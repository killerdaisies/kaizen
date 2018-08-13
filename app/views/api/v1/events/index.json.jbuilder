json.events do
  json.array! @events do |event|
    json.id event.id
    json.description event.description
    json.address event.address
    json.start event.start.strftime("%e %b %Y %H:%M:%S%p")
    json.end event.end.strftime("%e %b %Y %H:%M:%S%p")
    json.latitude event.latitude
    json.longitude event.longitude
    json.capacity events.capacity
    json.completed event.completed
    json.user_id event.user_id
  end
end
