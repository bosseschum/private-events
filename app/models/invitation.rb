class Invitation < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

  validates :status, presence: true
  validates :recipient, uniqueness: { scope: :event_id }

  enum status: { pending: 0, accepted: 1, declined: 2 }, default: :pending

  def accept!
    ActiveRecord::Base.transaction do
      update!(status: :accepted)
      Registration.create!(event: event, attendee: recipient)
    end
  end

  def decline!
    update!(status: :declined)
  end
end
