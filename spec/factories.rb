FactoryBot.define do
  factory :user  do
    email { "test@test.com" }
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
end
