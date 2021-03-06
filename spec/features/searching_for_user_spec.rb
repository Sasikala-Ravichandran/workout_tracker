require 'rails_helper'

RSpec.feature "Searching for users" do
  
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @sara = create(:user, first_name: "Sara", last_name: "Doe")
    @max = create(:user, first_name: "Max", last_name: "Doe")
  end

  scenario "with existing name returns all those users" do
    visit "/"

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sara.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end