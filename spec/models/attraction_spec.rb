require 'rails_helper'

RSpec.describe Attraction, type: :model do
  it "should have a name" do
    attraction = build(:attraction, name: nil)
    expect(attraction).to_not be_valid
  end
  it "should have a description" do
    attraction = build(:attraction, description: nil)
    expect(attraction).to_not be_valid
  end
  it "should not have spaces" do
    attraction = build(:attraction, name: "with space")
    expect(attraction).to_not be_valid
  end
  it "should not capital letters" do
    attraction = build(:attraction, name: "CapitalLetters")
    expect(attraction).to_not be_valid
  end
  it "has many posts" do
    t = Attraction.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end
  it "delete should destroy member" do
    attraction = create(:attraction)
    user = create(:user)
    attraction_member = create(:attraction_member, attraction: attraction, user: user)
    attraction.destroy
    expect(AttractionMember.all).not_to include attraction_member
  end
end
