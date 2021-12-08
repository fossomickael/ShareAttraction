require 'rails_helper'

feature "user creates attraction" do
  scenario "sucessfully" do
    sign_in
    visit new_attraction_path
    fill_in "attraction_name", with: "growaudience"
    fill_in "attraction_description", with: "This attraction group is to grow your audience"
    click_on "Create Attraction"
    expect(page).to have_css 'h1', text: 'Invite members to your attraction'
  end

  scenario "and his member of the new attraction" do
    user = create(:user)
    sign_in_as(user)
    visit new_attraction_path
    fill_in "attraction_name", with: "growaudience"
    fill_in "attraction_description", with: "This attraction group is to grow your audience"
    click_on "Create Attraction"
    expect(user.attractions[0].name).to eq 'growaudience'
  end
end
