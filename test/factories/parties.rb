FactoryBot.define do
  factory :party, class: Party do
    start_time { Faker::Time.forward(days: 5, period: :evening, format: :long) }
    api_movie_id { Faker::Number.between(from: 1, to: 100) }
  end
end
