require 'rails_helper'

feature "user can see invite page" do
  scenario "sucessfully" do
    user = create(:user)
    attraction = create(:attraction)
    create(:attraction_member, user: user, attraction: attraction)
    sign_in_as(user)
    visit attraction_invite_path(attraction)
    expect(page).to have_css 'h1', text: "Invite members to your attraction"
  end

  scenario "and invite people" do
    user = create(:user)
    attraction = create(:attraction)
    create(:attraction_member, user: user, attraction: attraction)
    sign_in_as(user)
    visit attraction_invite_path(attraction)
    fill_in "user_emails", with: "azerty@aqwaqwaqw.com"
    click_on "Invite!"
    last_user = User.last
    expect(last_user.email).to eq("azerty@aqwaqwaqw.com")
  end
end