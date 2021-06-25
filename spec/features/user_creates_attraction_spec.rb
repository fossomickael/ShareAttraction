require 'rails_helper'

feature "user creates attraction" do
  scenario "sucessfully" do
    sign_in
    visit new_attraction_path
    fill_in "attraction_name", with: "Grow Audience"
    fill_in "attraction_description", with: "This attraction group is to grow your audience"
    click_on "Create Attraction"
    expect(page).to have_css 'h1', text: 'Grow Audience'
  end
end
