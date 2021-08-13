require 'rails_helper'

feature "user edit posts" do
  scenario "sucessfully" do
    mike = create(:user)
    post = create(:post, user: mike)
    sign_in_as(mike)
    visit edit_post_path(post)
    fill_in "post_title", with: "Grow Audience Edit"
    click_on "Update Post"
    expect(page).to have_css 'h1', text: 'Grow Audience Edit'
  end
end
