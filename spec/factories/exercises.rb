FactoryGirl.define do
  factory :exercise do
    duration_in_min Faker::Number.number(2)
    workout Faker::Lorem.word
    workout_date Faker::Date.forward(1)
    user
  end
end
