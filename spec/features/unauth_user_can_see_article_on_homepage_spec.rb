require 'rails_helper'

feature "unauth user can see a post on homepage" do
  scenario "sucessfully" do
    post = create(:post, title: "How to be have a great hompepage")
    visit root_path
    expect(page).to have_css '.article_title', text: post.title
  end
end
