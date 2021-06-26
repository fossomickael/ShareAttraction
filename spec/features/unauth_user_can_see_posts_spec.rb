require 'rails_helper'

feature "unauth user can see a post" do
  scenario "sucessfully" do
    post = create(:post, title: "How to be have a great hompepage")
    visit post_path(post)
    expect(page).to have_css 'h1', text: post.title
  end
end
