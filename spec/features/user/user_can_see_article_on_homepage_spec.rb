require 'rails_helper'

feature "user visits home page" do
  scenario "sucessfully" do
    post = create(:post, title: "How to be have a great hompepage")
    visit root_path
    expect(page).to have_css 'h2', text: post.title
  end
end
