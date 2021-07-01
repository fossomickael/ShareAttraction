require 'rails_helper'

 feature "user can see group attractions on Dashboard" do
#   scenario "successfully" do
#     users = FactoryBot.build_list(:user, 2)
#     post_author = users[1]
#     other_user = users[0]
#     attraction = create(:attraction)
#     post = create(:post, user: post_author, attraction: attraction)
#     create(:attraction_member, user: post_author, attraction: attraction)
#     create(:attraction_member, user: other_user, attraction: attraction)
#     sign_in_as(other_user)
#     wait_for_changes
#     expect(page).to have_content(text)
#   end

#   scenario "see links with his referrer code" do
#     users = FactoryBot.create_list(:user, 2)
#     post_author = users[1]
#     other_user = users[0]
#     attraction = create(:attraction)
#     post = create(:post, user: post_author, attraction: attraction)
#     create(:attraction_member, user: post_author, attraction: attraction)
#     create(:attraction_member, user: other_user, attraction: attraction)
#     sign_in_as(other_user)

#     expect(page).to have_content(other_user.referrer_code)
#   end

  scenario "user who is not a member of the Attraction group cannot see post" do
    users = FactoryBot.build_list(:user, 2)
    post_author = users[1]
    other_user = users[0]
    attraction = create(:attraction)
    post = create(:post, user: post_author, attraction: attraction)
    create(:attraction_member, user: post_author, attraction: attraction)
    sign_in_as(other_user)
    expect(page).not_to have_css 'h3', text: post.title
  end
end
