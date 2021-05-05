FactoryBot.define do
  factory :user do
    username { 'suzuki' }
    email { 'suzuki@test.jp' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
