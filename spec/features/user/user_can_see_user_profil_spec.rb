require 'rails_helper'

feature "unauthuser can see a user profile" do
  scenario "sucessfully" do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_css 'h1', text: user.username
  end
end
