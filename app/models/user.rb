class User < ApplicationRecord
  has_many :events
  has_many :bookings, dependent: :destroy
  has_many :booked_events, through: :bookings, source: :event
end
