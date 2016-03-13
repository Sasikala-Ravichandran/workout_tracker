require 'rails_helper'

RSpec.feature "Displaying friends" do
  
  before do
    @john = create(:user)
    @sara = create(:user)

    @following = create(:friendship, user_id: @john.id, friend_id: @sara.id)
    login_as(@john)
  end

  scenario do
    visit root_path

    click_link "My Lounge"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sara.full_name)
    expect(page).to have_link("Unfollow")
  end

end