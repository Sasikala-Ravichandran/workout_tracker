require 'rails_helper'

RSpec.feature "Editing Exercise" do
  
  before do
    @john = create(:user)
    @exercise_1 = create(:exercise, duration_in_min: 50, user_id: @john.id)
    login_as(@john)
    visit "/"
    click_link "My Lounge"
    link = "a[href='/users/#{@john.id}/exercises/#{@exercise_1.id}/edit']"
    find(link).click
  end

  scenario "with valid inputs" do
    fill_in "Duration(min)", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(50)
  end

  scenario "with invalid inputs" do
    fill_in "Duration(min)", with: nil
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has not been updated")
    expect(page).to have_content("errors prohibited this exercise from being saved")
  end

end