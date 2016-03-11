require 'rails_helper'

RSpec.feature "Signing out" do
  
  before do
    @john = create(:user)
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button 'Log in'
  end

  scenario do
    visit '/'
    click_link 'Signout'
    expect(page).to have_content("Signed out successfully.")
    expect(current_path).to eq(root_path)
  end
end