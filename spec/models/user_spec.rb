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
  it "has many post referrals" do
    t = User.reflect_on_association(:post_referrers)
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
  it "should have an username" do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end
  it "should not have space in username" do
    user = build(:user, username: "with space")
    expect(user).to_not be_valid
  end
  it "has_many mentions" do
    t = Post.reflect_on_association(:mentions)
    expect(t.macro).to eq(:has_many)
  end
  it "has many mentioned posts" do
    should respond_to(:mentioned_posts)
  end
  it "username should be unique" do
    create(:user, username: "same")
    user2 = build(:user, username: "same")
    expect(user2).to_not be_valid
  end
  it "email should be unique" do
    create(:user, email: "same@same.com")
    user2 = build(:user, email: "same@same.com")
    expect(user2).to_not be_valid
  end
  it "a referrer code is generated after commit" do
    user = create(:user)
    expect(user.referrer_code.is_a?(String)).to be true
  end
  it "destroys depends attraction_members" do
    user_delete = create(:user, email: "will@delete.com")
    attraction_member = create(:attraction_member, user: user_delete)
    user_delete.destroy
    expect(AttractionMember.all).not_to include attraction_member
  end
  it "destroys depends post" do
    user_delete = create(:user, email: "will@delete.com")
    post = create(:post, user: user_delete)
    user_delete.destroy
    expect(Post.all).not_to include post
  end
  it "destroys depends post_referrer " do
    user_delete = create(:user, email: "will@delete.com")
    post_need_delete = create(:post, user: user_delete)
    post_referrer = create(:post_referrer, user: user_delete, post: post_need_delete)
    user_delete.destroy
    expect(PostReferrer.all).not_to include post_referrer
  end
end
