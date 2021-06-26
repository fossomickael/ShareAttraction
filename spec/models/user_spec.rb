require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many posts" do
    t = User.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end
  it "has many attractions" do
    t = User.reflect_on_association(:attractions)
    expect(t.macro).to eq(:has_many)
  end
  it "has many attraction_members" do
    t = User.reflect_on_association(:attraction_members)
    expect(t.macro).to eq(:has_many)
  end
  it "should have an email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
  it "should have a password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end
  it "a referrer code ig generated after commit" do
    user = create(:user)
    expect(user.referrer_code.is_a?(String)).to be true
  end
end
