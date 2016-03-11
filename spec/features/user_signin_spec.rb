require 'rails_helper'

RSpec.feature 'Signing in user' do

  before do
    @john = create(:user)
  end

  scenario 'with valid credentials' do

    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button 'Log in'
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
  end

  scenario 'with invalid credentials' do

    visit '/'
    click_link "Sign in"
    fill_in "Email", with: ""
    fill_in "Password", with: @john.password
    click_button 'Log in'
    expect(page).to have_content("Invalid email or password.")
    expect(current_path).to eq(new_user_session_path)
  end

end