FactoryBot.define do
  factory :post do
    content { "TestText" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "app/assets/images/test.jpg")) }
    association :user
  end
end
