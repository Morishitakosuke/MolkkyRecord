FactoryBot.define do
  factory :post do
    content { "TestText" }
    image { "app/assets/images/test.jpg" }
    association :user
  end
end
