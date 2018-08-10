json.events do
  json.array! @events do |event|
    json.id event.id
    json.description event.description
    json.address event.address
    json.start event.start.strftime("%e %b %Y %H:%M:%S%p")
    json.end event.end.strftime("%e %b %Y %H:%M:%S%p")
    json.capacity event.capacity
    json.completed event.completed
  end
end
