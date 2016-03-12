require 'rails_helper'

RSpec.feature "Listing Members" do
  
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @joe = create(:user, first_name: "Joe", last_name: "Doe")
  end

  scenario "showing a list of registered members" do
    visit "/"
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@joe.full_name)
  end
end