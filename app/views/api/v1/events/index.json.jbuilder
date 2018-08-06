json.events do
  json.array! @events do |event|
    json.extract! event, :id, :description, :start_time, :end_time, :capacity, :completed
  end
end
