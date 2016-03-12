require 'rails_helper'

RSpec.feature "Creating Exercise" do
  
  before do
    @john = create(:user)
    login_as(@john)
    
    visit '/'
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")
    
  end

  scenario "with valid inputs" do
    fill_in "Duration(min)", with: 20
    fill_in "Workout Details", with: "Cardio"
    fill_in "Activity date", with: "2015-08-07"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    expect(page.current_path).to eq(user_exercise_path(@john, Exercise.last))
  end

  scenario "with invalid inputs" do
    fill_in "Duration(min)", with: nil
    fill_in "Workout Details", with: nil
    fill_in "Activity date", with: nil
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("errors prohibited this exercise from being saved")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end
end