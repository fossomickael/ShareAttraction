json.attractions @attractions do |attraction|
  json.extract! attraction, :id, :name
  json.posts attraction.posts do |post|
    json.extract! post, :id, :title
    if post.mentioned?(@user)
      json.mentioned true
    else
      json.mentioned false
    end
    json.author post.user.username
    json.twitter_link post.twitter_link
    json.linkedin_link post.linkedin_link
    json.link post.link
    json.referrer_code @user.referrer_code
  end
end
