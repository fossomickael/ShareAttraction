require 'rails_helper'
feature "user is redirected to dashboard" do
  scenario "sucessfully" do
    sign_in
    expect(page).to have_css 'h1', text: 'My Attractions'
  end
end
