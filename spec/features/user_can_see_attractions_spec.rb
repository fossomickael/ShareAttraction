require 'rails_helper'

feature "user can see attractions" do
  scenario "sucessfully" do

    attraction = create(:attraction)
    visit attractions_path
    expect(page).to have_css 'li', text: attraction.name
  end
end
