class User < ApplicationRecord
  has_many :registrations, foreign_key: "attendee_id", dependent: :destroy
  has_many :hosted_events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy
  has_many :attended_events, through: :registrations, source: :event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
