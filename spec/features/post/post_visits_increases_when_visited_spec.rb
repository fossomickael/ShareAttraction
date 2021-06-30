require 'rails_helper'

feature "when post is visited" do
  scenario "number of visit is incremented" do
    post = create(:post)
    visit post_path(post)
    post.reload
    expect(post.visits == 1).to be true
  end
end
