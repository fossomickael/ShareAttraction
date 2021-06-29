require 'rails_helper'

RSpec.describe Mention, type: :model do
  it "is valid with user and post" do
    post = create(:post)
    user = create(:user)
    mention = create(:mention, user: user, post: post)
    expect(mention).to be_valid
  end
  it "should have a user" do
    post = build(:post)
    mention = build(:mention, user: nil, post: post)
    expect(mention).to_not be_valid
  end
  it "should be the right user" do
    post = create(:post)
    user = create(:user)
    mention = create(:mention, user: user, post: post)
    expect(mention.user.id).to eq user.id
  end
  it "should have a post" do
    user = build(:user)
    mention = build(:mention, user: user, post: nil)
    expect(mention).to_not be_valid
  end
  it "post with one mention should create one mention" do
    user = create(:user, username: "test")
    post = create(:post, content: "@test")
    expect(Mention.count).to eq 1
  end
  it "post with two mentions should create two mentions" do
    user = create(:user, username: "test")
    mike = create(:user, username: "mike")
    post = create(:post, content: "@test @mike")
    expect(Mention.count).to eq 2
  end
  it "post with unknown user should not create mention" do
    post = create(:post, content: "@idontexist")
    expect(Mention.count).to eq 0
  end
  it "post no mention should no create mentions" do
    post = create(:post, content: "no mention")
    expect(Mention.count).to eq 0
  end
  it "no duplicated mentions" do
    user = build(:user, username: "elie")
    post = build(:post, content: "@elie")
    mention = create(:mention, user: user, post: post)
    mention2 = build(:mention, user: user, post: post)
    expect(mention2).to_not be_valid
  end
  
end
