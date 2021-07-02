require 'rails_helper'

describe 'Attractions API', type: :request do
  scenario "render json with mentioned" do
    author = create(:user, username: "test")
    post = create(:post, content: "@test")
    get :"/api/v1/attractions/user/mentioned/#{author.username}"
    json = JSON.parse(response.body)
    expect(json.keys).to contain_exactly('mentioned_posts')
  end
  scenario "render json post" do
    mentioned_user = create(:user, username: "test")
    author = create(:user, username: "author")
    post = create(:post, content: "@test", user: author)
    get :"/api/v1/attractions/user/mentioned/#{mentioned_user.username}"
    json = JSON.parse(response.body)
    expect(json["mentioned_posts"][0]["title"]).to eq(post.title)
    expect(json["mentioned_posts"][0]["id"]).to eq(post.id)
    expect(json["mentioned_posts"][0]["author"]).to eq(author.username)
    expect(json["mentioned_posts"][0]["attraction_name"]).to eq(post.attraction.name)
  end
end