class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user, scope: :event

  def events
    Event.find(self.event_id).serializable_hash
  end
end
