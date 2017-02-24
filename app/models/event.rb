class Event < ApplicationRecord
  has_many :users

  validates :night_out, presence: true
  validates :outdoor_activity, presence: true
  validates :workout_buddy, presence: true
  validates :play_date, presence: true
end
