FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "My awesome Article #{n}" }
    sequence(:content) { |n| "My awesome Content #{n}" }
    sequence(:slug) { |n| "my-awesome-slug-#{n}" }
  end
end
