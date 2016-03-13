require 'rails_helper'

RSpec.feature "Unfollowing Friend" do
  
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @sara = create(:user, first_name: "Sara", last_name: "Doe")
    @following = create(:friendship, user_id: @john.id, friend_id: @sara.id)
    login_as(@john)
  end

  scenario do
    visit "/"
    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@sara.full_name + " unfollowed")
  end
end