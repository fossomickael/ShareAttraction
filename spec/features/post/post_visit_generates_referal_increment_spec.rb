require 'rails_helper'

feature "when post is visited" do
  scenario "increments the referal" do
    users = FactoryBot.create_list(:user, 2)
    post_author = users[1]
    other_user = users[0]
    attraction = create(:attraction, name: "attraction")
    post = create(:post, title: "titre")

    visit "#{post_path(post)}?ref=#{other_user.referrer_code}"
    create(:attraction_member, user: post_author, attraction: attraction)
    create(:attraction_member, user: other_user, attraction: attraction)

    referrer = PostReferrer.where(user: other_user, post: post).take
    expect(referrer.count == 1).to be true
  end
end
