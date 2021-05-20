FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    username { Faker::Color.unique.color_name }
    password { Faker::Internet.password }
  end
end
