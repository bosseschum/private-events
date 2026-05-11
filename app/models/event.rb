class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :title, :description, :date, :location, :creator, presence: true
  validates :registrations, uniqueness: true
end
