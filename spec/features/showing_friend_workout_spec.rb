require 'rails_helper'

RSpec.feature "Showing friend's workout" do
  
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @sara = create(:user, first_name: "Sara", last_name: "Doe")
    @sara_exercise = create(:exercise, user_id: @sara.id)
    @friendship = create(:friendship, user_id: @john.id, friend_id: @sara.id)
    login_as(@john)
  end

  scenario do
    visit "/"

    click_link "My Lounge"
    click_link @sara.full_name

    expect(page).to have_content(@sara.full_name + "'s Exercises")
    expect(page).to have_content(@sara_exercisea.workout)
    expect(page).to have_css("div#chart")
  end

end