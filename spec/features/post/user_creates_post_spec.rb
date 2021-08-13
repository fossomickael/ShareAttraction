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
  scenario "can see his attraction" do
    sign_in
    attraction = create(:attraction)
    visit new_post_path
    find(:css, '#post_title')
    fill_in "post_title", with: "Grow Audience"

    select attraction.name, from: "post_attraction_id"
    click_on "Create Post"
    expect(page).to have_css 'h4', text: attraction.name
  end
  scenario "can see his username" do
    user = create(:user)
    sign_in_as(user)
    attraction = create(:attraction)
    visit new_post_path
    find(:css, '#post_title')
    fill_in "post_title", with: "Grow Audience"

    select attraction.name, from: "post_attraction_id"
    click_on "Create Post"
    expect(page).to have_css 'h4', text: user.username
  end
end
