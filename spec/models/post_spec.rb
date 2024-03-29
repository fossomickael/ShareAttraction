require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "can belong to an attraction" do
    t = Post.reflect_on_association(:attraction)
    expect(t.macro).to eq(:belongs_to)
  end
  it "can have a a user" do
    t = Post.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
  it "should have a user" do
    post = build(:post, user: nil)
    expect(post).to_not be_valid
  end
  it "should have a attraction" do
    post = build(:post, attraction: nil)
    expect(post).to_not be_valid
  end
  it "should have a name" do
    post = build(:post, title: nil)
    expect(post).to_not be_valid
  end
  it "can contain a mention" do
    post = build(:post, content: "@test")
    expect(post).to be_valid
  end
  
  it "mentioned should return true if mentioned" do
    post = create(:post)
    user = create(:user)
    mention = create(:mention, user: user, post: post)
    expect(post.mentioned?(user)).to be true
  end
  it "mentioned should return false if not mentioned" do
    post = create(:post)
    user = create(:user)
    expect(post.mentioned?(user)).to be false
  end
  it "should return a valid Twitter link" do
    mike = create(:user, username: "Mike")
    post = create(:post, title: "Grow", user: mike)
    p = URI::Parser.new
    escape_str = p.escape("https://twitter.com/intent/tweet?text=#{post.title} by #{mike.username}&url=https://shareattraction.com/#{post.id}")
    expect(post.twitter_link).to eq escape_str
  end
  it "should return a valid link " do
    post = create(:post, title: "Grow")
    expect(post.link).to eq "https://shareattraction.com/#{post.id}"
  end
end
