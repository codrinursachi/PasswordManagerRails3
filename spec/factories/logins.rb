FactoryBot.define do
  factory :login do
    name { "MyString" }
    login_name { "MyString" }
    login_password { "MyString" }
    notes { "MyText" }
    is_favorite { false }
    folder { nil }
  end
end
