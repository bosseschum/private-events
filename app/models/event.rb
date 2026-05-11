class Event < ApplicationRecord
  has_many :registrations, class_name: "Registration", foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :registrations, source: :attendee

  belongs_to :creator, class_name: "User"

  validates :title, :description, :date, :location, :creator, presence: true
end
