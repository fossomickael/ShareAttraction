FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "name_#{n}@example.com" }
    sequence(:username) { |n| "attracter#{n}" }
    password { "4A54d65S4ad5qz4xw" }
  end

  factory :attraction do
    name { "Grow Fast" }
    description { "Grow Your Brand Fast" }
  end

  factory :post do
    # The alias allows us to write author instead of
    # association :author, factory: :user
    user
    attraction
    title { "How to grow your audience" }
    content { "There are five steps involved." }
  end

  factory :attraction_member do
    user
    attraction
  end

  factory :post_referrer do
    user
    post
    count { 0 }
  end

  def user_with_posts(posts_count: 5)
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:post, posts_count, user: user)
    end
  end
end
