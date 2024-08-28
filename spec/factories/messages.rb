FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence }
    user
    conversation { nil }
    group { nil }
  end
end