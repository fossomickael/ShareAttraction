require 'rails_helper'

feature "user creates posts" do
  scenario "sucessfully" do
    sign_in
    attraction = create(:attraction)
    visit new_post_path
    find(:css, '#post_title')
    fill_in "post_title", with: "Grow Audience"

    select attraction.name, from: "post_attraction_id"
    click_on "Create Post"
    expect(page).to have_css 'h1', text: 'Grow Audience'
  end
end
