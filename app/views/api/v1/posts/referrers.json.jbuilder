json.extract! @post, :title
json.sharers @referrers do |referrer|
  json.extract! referrer.user, :username
  json.count referrer.count
end
