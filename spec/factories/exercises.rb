FactoryGirl.define do
  factory :exercise do
    duration_in_min 1
    workout "MyText"
    workout_date "2016-03-11"
    user nil
  end
end
