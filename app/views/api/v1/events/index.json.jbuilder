json.booked_events do
  json.array! @booked_events do |event|
    json.extract! event, :id, :description, :start, :end
  end
end
