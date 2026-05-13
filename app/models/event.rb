class Event < ApplicationRecord
  has_many :registrations, class_name: "Registration", foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :registrations, source: :attendee

  belongs_to :creator, class_name: "User"

  validates :title, :description, :date, :location, :creator, presence: true

  scope :upcoming, -> { where("date >= ?", Time.current).order(date: :asc) }
  scope :past, -> { where("date < ?", Time.current).order(date: :desc) }
end
