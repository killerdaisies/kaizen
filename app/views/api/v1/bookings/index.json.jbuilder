json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :user_id, :event_id
  end
end
