require 'rails_helper'

RSpec.feature "Following Friends" do
  
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @sara = create(:user, first_name: "Sara", last_name: "Doe")
    login_as(@john)
  end

  scenario do
    visit "/"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sara.full_name)
    expect(page).not_to have_link("Follow", href: "/friendships?friend_id=#{@john.id}")

    link = "a[href='/friendships?friend_id=#{@sara.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", href: "/friendships?friend_id=#{@sara.id}")
  end
end