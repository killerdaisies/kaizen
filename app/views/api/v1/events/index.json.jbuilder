json.events do
  json.array! @events do |event|
    json.extract! event, :id, :description, :start, :end, :capacity, :completed
  end
end
