FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "user#{n}@email.com" }
    password { "password" }
    password_confirmation { "password" }
    first_name { "First" }
    last_name { "Last" }
  end
end
