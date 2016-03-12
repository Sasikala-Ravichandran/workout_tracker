class Exercise < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :duration_in_min, :workout, :workout_date, :user_id
  validates :duration_in_min, numericality: { only_integer: true }
end
