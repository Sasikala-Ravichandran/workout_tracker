require 'rails_helper'

RSpec.feature "Lisiting Exercises" do
  
  before do
    @john = create(:user)
    login_as(@john)
    @exercise1 = create(:exercise, user_id: @john.id)
    @exercise2 = create(:exercise, user_id: @john.id)
  end

  scenario do
    visit '/'
    click_link "My Lounge"
    expect(page).to have_content(@exercise1.workout)
    expect(page).to have_content(@exercise2.workout)
  end

end