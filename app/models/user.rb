class User < ApplicationRecord
  has_many :events
  has_many :bookings, dependent: :destroy
end
