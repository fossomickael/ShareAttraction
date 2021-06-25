require 'rails_helper'

RSpec.describe User, type: :model do
  it "has many posts" do
    t = User.reflect_on_association(:posts)
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
end
