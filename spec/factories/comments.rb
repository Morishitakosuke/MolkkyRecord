FactoryBot.define do
  factory :comment do
    content { "TestComment" }
    association :user
    association :post
  end
end
