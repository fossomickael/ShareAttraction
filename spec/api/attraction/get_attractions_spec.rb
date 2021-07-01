require 'rails_helper'

describe 'Attraction API', type: :request do
  scenario "render json with attractions key" do
    author = create(:user)
    attraction = create(:attraction, name: "Growth")
    create(:attraction_member, user: author, attraction: attraction)
    create(:post, attraction:attraction, user: author)
    get :"/api/v1/attractions/user/#{author.username}"
    json = JSON.parse(response.body)
    expect(json.keys).to contain_exactly('attractions')
  end
  scenario "render json which contains joined attraction" do
    author = create(:user)
    attraction = create(:attraction, name: "Growth")
    create(:attraction_member, user: author, attraction: attraction)
    create(:post, attraction:attraction, user: author)
    get :"/api/v1/attractions/user/#{author.username}"
    json = JSON.parse(response.body)
    expect(json["attractions"][0]["id"]).to eq(attraction.id)
    expect(json["attractions"][0]["name"]).to eq(attraction.name)
  end
  scenario "render json which contains created post" do
    author = create(:user)
    attraction = create(:attraction, name: "Growth")
    create(:attraction_member, user: author, attraction: attraction)
    post = create(:post, attraction:attraction, user: author)
    get :"/api/v1/attractions/user/#{author.username}"
    json = JSON.parse(response.body)
    expect(json["attractions"][0]["posts"][0]["id"]).to eq(post.id)
    expect(json["attractions"][0]["posts"][0]["title"]).to eq(post.title)
    expect(json["attractions"][0]["posts"][0]["author"]).to eq(post.user.username)
    expect(json["attractions"][0]["posts"][0]["twitter_link"]).to eq(post.twitter_link)
  end
end
