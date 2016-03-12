require 'rails_helper'

RSpec.feature "Deleting Exercise" do
  
  before do
    @john = create(:user)
    @exercise = create(:exercise, user_id: @john.id)
    login_as(@john)
  end

  scenario do
    visit "/"
    click_link "My Lounge"
    link="//a[contains(@href, '/users/#{@john.id}/exercises/#{@exercise.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end