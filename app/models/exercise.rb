class Exercise < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :workout, :workout_date
  validates :duration_in_min, numericality: { only_integer: true }
end
