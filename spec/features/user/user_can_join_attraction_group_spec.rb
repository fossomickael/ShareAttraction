require 'rails_helper'

feature "user can join attractions" do
  scenario "should see Join if not a member" do
    sign_in
    attraction = create(:attraction)
    visit attraction_path(attraction)
    expect(page).to have_button 'Join'
  end

  scenario "sucessfully" do
    sign_in
    attraction = create(:attraction)
    visit attraction_path(attraction)
    click_on "Join"

    expect(page).to have_css '#joined', text: "Joined"
  end
end
