require 'rails_helper'

feature "user visits home page" do
  scenario "sucessfully" do
    visit root_path
    expect(page).to have_css 'h1', text: 'Share Attraction'
  end
end
