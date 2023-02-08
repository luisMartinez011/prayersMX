FactoryBot.define do
  factory :usuario do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
    name { Faker::Internet.username }
    # role { "admin"}
  end
end
