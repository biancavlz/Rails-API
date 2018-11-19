FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "jsmith_#{n}" }
    name { "John Smith" }
    url { "http://myexample.com" }
    avatar_url { "http://myexample.com/avatar" }
    provider { "github" }
  end
end
