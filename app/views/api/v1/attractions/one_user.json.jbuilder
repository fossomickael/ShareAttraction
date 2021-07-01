json.attractions @attractions do |attraction|
  json.extract! attraction, :id, :name
  json.posts attraction.posts do |post|
    json.extract! post, :id, :title
    if post.mentioned?(@user)
      json.mentioned true
    else
      json.mentioned false
    end
  end
end
