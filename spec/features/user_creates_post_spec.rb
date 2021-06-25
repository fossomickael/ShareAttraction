require 'rails_helper'

feature "user creates posts" do
  scenario "sucessfully" do
    sign_in
    attraction = create(:attraction)
    visit new_post_path
    fill_in "post_title", with: "Grow Audience"
    fill_in "post_content", with: "There are five steps involved"
    select attraction.name, from: "post_attraction_id"
    click_on "Create Post"
    expect(page).to have_css 'h1', text: 'Grow Audience'
  end
end
