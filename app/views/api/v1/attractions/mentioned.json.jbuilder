json.mentioned_posts @mentioned_posts do |post|
  json.extract! post, :id, :title
  json.author post.user.username
  json.twitter_link post.twitter_link
  json.linkedin_link post.linkedin_link
  json.link "#{ENV['SHORT_DOMAIN']/post.short_link.c}"
  json.referrer_code @user.referrer_code
  json.attraction_name post.attraction.name
end
