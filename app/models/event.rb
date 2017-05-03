class Event < ActiveRecord::Base
  has_many :matches 
  has_many :users, through: :matches

  validates :night_out, presence: true
  validates :outdoor_activity, presence: true
  validates :workout_buddy, presence: true
  validates :play_date, presence: true
end
