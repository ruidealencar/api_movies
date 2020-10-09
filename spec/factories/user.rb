FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password { Faker::Number.number(6) }
    authentication_token { SecureRandom.hex(10)}
  end
end
